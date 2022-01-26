-------------------------------------------------------------------------------
--
-- Filename    : vfp_s_axis.vhd
-- Create Date : 05012019 [05-01-2019]
-- Author      : Zakinder
--
-- Description:
-- This module receives video data(24-bits) in YCbCr 4:4:4 format  
-- with 8 bits per component and configured into axi stream 
-- YCbCr 4:2:2 format video(16-bits).
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants_package.all;
use work.vpf_records.all;
use work.ports_package.all;
entity vfp_s_axis is
generic (
    i_data_width             : integer := 8;
    b_data_width             : integer := 32;
    s_data_width             : integer := 16);
port (
    --stream clock/reset
    m_axis_mm2s_aclk         : in std_logic;
    m_axis_mm2s_aresetn      : in std_logic;
    --config
    iMmAxi                   : in integer;
    iStreamData              : in vStreamData;
    --stream to master out
    rx_axis_tready_o         : in std_logic;
    rx_axis_tvalid           : out std_logic;
    rx_axis_tuser            : out std_logic;
    rx_axis_tlast            : out std_logic;
    rx_axis_tdata            : out std_logic_vector(s_data_width-1 downto 0);
    --tx channel
    rgb_m_axis_tvalid        : out std_logic;
    rgb_m_axis_tlast         : out std_logic;
    rgb_m_axis_tuser         : out std_logic;
    rgb_m_axis_tready        : in std_logic;
    rgb_m_axis_tdata         : out std_logic_vector(s_data_width-1 downto 0);
    --rx channel
    rgb_s_axis_tready        : out std_logic;
    rgb_s_axis_tvalid        : in std_logic;
    rgb_s_axis_tuser         : in std_logic;
    rgb_s_axis_tlast         : in std_logic;
    rgb_s_axis_tdata         : in std_logic_vector(s_data_width-1 downto 0));
end vfp_s_axis;
architecture arch_imp of vfp_s_axis is
    signal sMmAxi            : integer;
    signal axis_sof          : std_logic;
    signal mpeg42XCR         : std_logic_vector(i_data_width-1 downto 0);
    signal mpeg42XBR         : std_logic :=lo;
    signal mpeg42XXX         : std_logic :=lo;
    signal tx_axis_tvalid    : std_logic;
    signal tx_axis_tlast     : std_logic;
    signal tx_axis_tuser     : std_logic;
    signal tx_axis_tready    : std_logic;
	signal pEofs1            : std_logic :=lo;
    signal tx_axis_tdata     : std_logic_vector(s_data_width-1 downto 0);
    type video_io_state is (VIDEO_SET_RESET,VIDEO_SOF_OFF,VIDEO_SOF_ON,VIDEO_END_OF_LINE);
    signal VIDEO_STATES      : video_io_state;
    signal nrowdist          : natural range 0 to 4096 := 0;
begin
-- generate the toggle signal to convert from ycbcr 444 to 422(green/red,blue/red)
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then
            mpeg42XBR  <= not(mpeg42XBR) and iStreamData.ycbcr.valid;
            mpeg42XXX  <= not(mpeg42XBR);
    end if;
end process;
-- delay the rgb blue pixel to sync it with red channel
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then
            mpeg42XCR   <= iStreamData.ycbcr.blue;
    end if;
end process;
process (m_axis_mm2s_aclk) begin
    if (rising_edge (m_axis_mm2s_aclk)) then
        sMmAxi <= iMmAxi;
        if (m_axis_mm2s_aresetn = lo) then
            VIDEO_STATES <= VIDEO_SET_RESET;
        else
            tx_axis_tuser <=axis_sof;
        case (VIDEO_STATES) is
        when VIDEO_SET_RESET =>
            tx_axis_tlast  <= lo;
            tx_axis_tvalid <= lo;
            tx_axis_tdata  <= (others => lo);
            axis_sof       <= lo;
            nrowdist       <= zero;
        if (iStreamData.sof = '1') then
            VIDEO_STATES <= VIDEO_SOF_OFF;
        else
            VIDEO_STATES <= VIDEO_SET_RESET;
        end if;
        when VIDEO_SOF_OFF =>
        nrowdist       <= zero;
        if (iStreamData.ycbcr.valid = hi) then
            VIDEO_STATES <= VIDEO_SOF_ON;
            axis_sof     <= hi;
        else
            VIDEO_STATES <= VIDEO_SOF_OFF;
        end if;
        when VIDEO_SOF_ON =>
            axis_sof       <= lo;
			tx_axis_tvalid <= hi;
            if(iStreamData.eof = hi) then
                pEofs1 <= hi;
            end if;
            if (sMmAxi = EXTERNAL_AXIS_STREAM)then
                if(mpeg42XXX =hi)then
                    tx_axis_tdata  <= (iStreamData.ycbcr.green & iStreamData.ycbcr.red);
                else
                    tx_axis_tdata  <= (mpeg42XCR & iStreamData.ycbcr.red);
                end if;
            elsif (sMmAxi = STREAM_TESTPATTERN1)then
                nrowdist        <= nrowdist + one;
                tx_axis_tdata   <= std_logic_vector(to_unsigned(nrowdist,s_data_width));
                --tx_axis_tdata  <= iStreamData.cord.x;
            elsif (sMmAxi = STREAM_TESTPATTERN2)then
                nrowdist        <= nrowdist + 2;
                tx_axis_tdata   <= std_logic_vector(to_unsigned(nrowdist,s_data_width));
                --tx_axis_tdata  <= iStreamData.cord.y;
            elsif (sMmAxi = STREAM_TESTPATTERN3)then
                tx_axis_tdata   <= std_logic_vector(to_unsigned(nrowdist,s_data_width));
            elsif (sMmAxi = STREAM_TESTPATTERN4)then
                tx_axis_tdata <= std_logic_vector(resize(unsigned(iStreamData.ycbcr.green), tx_axis_tdata'length));
            elsif (sMmAxi = STREAM_TESTPATTERN5)then
                tx_axis_tdata  <= (iStreamData.ycbcr.green & iStreamData.ycbcr.red);
            elsif (sMmAxi = STREAM_TESTPATTERN6)then
                tx_axis_tdata  <= (mpeg42XCR & iStreamData.ycbcr.red);
            else
                if(mpeg42XXX =hi)then
                    tx_axis_tdata  <= (iStreamData.ycbcr.green & iStreamData.ycbcr.red);
                else
                    tx_axis_tdata  <= (mpeg42XCR & iStreamData.ycbcr.red);
                end if;
            end if;
        if (iStreamData.ycbcr.valid = hi) then
            tx_axis_tlast  <= lo;
            VIDEO_STATES <= VIDEO_SOF_ON;
        else
            tx_axis_tlast  <= hi;
            VIDEO_STATES <= VIDEO_END_OF_LINE;
        end if;
        when VIDEO_END_OF_LINE =>
            tx_axis_tlast  <= lo;
            tx_axis_tvalid <= lo;
            nrowdist       <= zero;
            if (pEofs1 = hi) then
                VIDEO_STATES <= VIDEO_SOF_OFF;
				pEofs1 <= lo;
            elsif (iStreamData.ycbcr.valid = hi) then
                VIDEO_STATES <= VIDEO_SOF_ON;
            else
                VIDEO_STATES <= VIDEO_END_OF_LINE;
            end if;
        when others =>
            VIDEO_STATES <= VIDEO_SET_RESET;
        end case;
        end if;
    end if;
end process;
process (m_axis_mm2s_aclk) begin
    if rising_edge(m_axis_mm2s_aclk) then
        if m_axis_mm2s_aresetn = lo then
            rx_axis_tvalid     <= lo;
            rx_axis_tuser      <= lo;
            rx_axis_tlast      <= lo;
            rx_axis_tdata      <= (others => lo);
            rgb_m_axis_tvalid  <= lo;
            rgb_m_axis_tuser   <= lo;
            rgb_m_axis_tlast   <= lo;
            rgb_m_axis_tdata   <= (others => lo);
            tx_axis_tready     <= lo;
        else
            if (sMmAxi = EXTERNAL_AXIS_STREAM)then
                --external processed(unused) parallel copy of cpuTX delayed
                rgb_s_axis_tready  <= rx_axis_tready_o;
                rx_axis_tvalid     <= rgb_s_axis_tvalid;
                rx_axis_tuser      <= rgb_s_axis_tuser;
                rx_axis_tlast      <= rgb_s_axis_tlast;
                rx_axis_tdata      <= rgb_s_axis_tdata;
            else
                -- to cpuTX
                rx_axis_tvalid     <= tx_axis_tvalid;
                rx_axis_tuser      <= tx_axis_tuser;
                rx_axis_tlast      <= tx_axis_tlast;
                rx_axis_tdata      <= tx_axis_tdata;
            end if;
                --parallel internal copy of cpuTX
                tx_axis_tready     <= rgb_m_axis_tready;
                rgb_m_axis_tvalid  <= tx_axis_tvalid;
                rgb_m_axis_tuser   <= tx_axis_tuser;
                rgb_m_axis_tlast   <= tx_axis_tlast;
                rgb_m_axis_tdata   <= tx_axis_tdata;
        end if;
    end if;
end process;
end arch_imp;