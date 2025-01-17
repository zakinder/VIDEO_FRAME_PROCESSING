--04282019 [04-28-2019]
library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fixed_pkg.all;
use work.float_pkg.all;
use work.constants_package.all;
package vpf_records is
type ty1sf is record
    k1               : sfixed(4 downto -3);
    k2               : sfixed(4 downto -3);
    k3               : sfixed(4 downto -3);
    k4               : sfixed(4 downto -3);
    k5               : sfixed(4 downto -3);
    k6               : sfixed(4 downto -3);
    k7               : sfixed(4 downto -3);
    k8               : sfixed(4 downto -3);
    k9               : sfixed(4 downto -3);
end record;
type ty2sf is record
    k1               : sfixed(24 downto -3);
    k2               : sfixed(24 downto -3);
    k3               : sfixed(24 downto -3);
    k4               : sfixed(24 downto -3);
    k5               : sfixed(24 downto -3);
    k6               : sfixed(24 downto -3);
    k7               : sfixed(24 downto -3);
    k8               : sfixed(24 downto -3);
    k9               : sfixed(24 downto -3);
end record;
type ty2sn is record
    k1               : signed(19 downto 0);
    k2               : signed(19 downto 0);
    k3               : signed(19 downto 0);
    k4               : signed(19 downto 0);
    k5               : signed(19 downto 0);
    k6               : signed(19 downto 0);
    k7               : signed(19 downto 0);
    k8               : signed(19 downto 0);
    k9               : signed(19 downto 0);
end record;
type ty1sn is record
    k1               : signed(14 downto 0);
    k2               : signed(14 downto 0);
    k3               : signed(14 downto 0);
    k4               : signed(14 downto 0);
    k5               : signed(14 downto 0);
    k6               : signed(14 downto 0);
    k7               : signed(14 downto 0);
    k8               : signed(14 downto 0);
    k9               : signed(14 downto 0);
end record;
type ccKernel is record
    ccSf             : ty1sf;
    ccProdSf         : ty2sf;
    ccProdToSn       : ty2sn;
    ccProdTrSn       : ty1sn;
end record;
type t15b3ksn is record
    k1               : sfixed(15 downto -3);
    k2               : sfixed(15 downto -3);
    k3               : sfixed(15 downto -3);
    k4               : sfixed(15 downto -3);
    k5               : sfixed(15 downto -3);
    k6               : sfixed(15 downto -3);
    k7               : sfixed(15 downto -3);
    k8               : sfixed(15 downto -3);
    k9               : sfixed(15 downto -3);
end record;
type t15b3kksn is record
    k1               : sfixed(15 downto -3);
    k2               : sfixed(15 downto -3);
    k3               : sfixed(15 downto -3);
    k4               : sfixed(15 downto -3);
    k5               : sfixed(15 downto -3);
    k6               : sfixed(15 downto -3);
    k7               : sfixed(15 downto -3);
    k8               : sfixed(15 downto -3);
    k9               : sfixed(15 downto -3);
    k10              : sfixed(15 downto -3);
    k11              : sfixed(15 downto -3);
    k12              : sfixed(15 downto -3);
    k13              : sfixed(15 downto -3);
    k14              : sfixed(15 downto -3);
    k15              : sfixed(15 downto -3);
    k16              : sfixed(15 downto -3);
end record;
type k16natrual is record
    k1               : natural;
    k2               : natural;
    k3               : natural;
    k4               : natural;
    k5               : natural;
    k6               : natural;
    k7               : natural;
    k8               : natural;
    k9               : natural;
    k10              : natural;
    k11              : natural;
    k12              : natural;
    k13              : natural;
    k14              : natural;
    k15              : natural;
    k16              : natural;
end record;
type t14b4ksn is record
    k1               : sfixed(16 downto -2);
    k2               : sfixed(16 downto -2);
    k3               : sfixed(16 downto -2);
    k4               : sfixed(16 downto -2);
    k5               : sfixed(16 downto -2);
    k6               : sfixed(16 downto -2);
    k7               : sfixed(16 downto -2);
    k8               : sfixed(16 downto -2);
    k9               : sfixed(16 downto -2);
end record;
type t14b4kksn is record
    k1               : sfixed(16 downto -2);
    k2               : sfixed(16 downto -2);
    k3               : sfixed(16 downto -2);
    k4               : sfixed(16 downto -2);
    k5               : sfixed(16 downto -2);
    k6               : sfixed(16 downto -2);
    k7               : sfixed(16 downto -2);
    k8               : sfixed(16 downto -2);
    k9               : sfixed(16 downto -2);
    k10              : sfixed(16 downto -2);
    k11              : sfixed(16 downto -2);
    k12              : sfixed(16 downto -2);
    k13              : sfixed(16 downto -2);
    k14              : sfixed(16 downto -2);
    k15              : sfixed(16 downto -2);
    k16              : sfixed(16 downto -2);
end record;
type t8b4ksn is record
    k1               : sfixed(8 downto -3);
    k2               : sfixed(8 downto -3);
    k3               : sfixed(8 downto -3);
    k4               : sfixed(8 downto -3);
    k5               : sfixed(8 downto -3);
    k6               : sfixed(8 downto -3);
    k7               : sfixed(8 downto -3);
    k8               : sfixed(8 downto -3);
    k9               : sfixed(8 downto -3);
end record;
type t8b2ksn is record
    k1               : sfixed(15 downto 0);
    k2               : sfixed(15 downto 0);
    k3               : sfixed(15 downto 0);
    k4               : sfixed(15 downto 0);
    k5               : sfixed(15 downto 0);
    k6               : sfixed(15 downto 0);
    k7               : sfixed(15 downto 0);
    k8               : sfixed(15 downto 0);
    k9               : sfixed(15 downto 0);
end record;
type t24b4ksn is record
    k1               : sfixed(24 downto -3);
    k2               : sfixed(24 downto -3);
    k3               : sfixed(24 downto -3);
    k4               : sfixed(24 downto -3);
    k5               : sfixed(24 downto -3);
    k6               : sfixed(24 downto -3);
    k7               : sfixed(24 downto -3);
    k8               : sfixed(24 downto -3);
    k9               : sfixed(24 downto -3);
end record;
type t32b4ksn is record
    k1               : sfixed(39 downto -3);
    k2               : sfixed(39 downto -3);
    k3               : sfixed(39 downto -3);
    k4               : sfixed(39 downto -3);
    k5               : sfixed(39 downto -3);
    k6               : sfixed(39 downto -3);
    k7               : sfixed(39 downto -3);
    k8               : sfixed(39 downto -3);
    k9               : sfixed(39 downto -3);
end record;
type t33b35ksn is record
    k1               : sfixed(44 downto -38);
    k2               : sfixed(44 downto -38);
    k3               : sfixed(44 downto -38);
    k4               : sfixed(44 downto -38);
    k5               : sfixed(44 downto -38);
    k6               : sfixed(44 downto -38);
    k7               : sfixed(44 downto -38);
    k8               : sfixed(44 downto -38);
    k9               : sfixed(44 downto -38);
end record;
type t24ksn is record
    k1               : sfixed(23 downto 0);
    k2               : sfixed(23 downto 0);
    k3               : sfixed(23 downto 0);
    k4               : sfixed(23 downto 0);
    k5               : sfixed(23 downto 0);
    k6               : sfixed(23 downto 0);
    k7               : sfixed(23 downto 0);
    k8               : sfixed(23 downto 0);
    k9               : sfixed(23 downto 0);
end record;
type t13ksn is record
    k1               : sfixed(11 downto 0);
    k2               : sfixed(11 downto 0);
    k3               : sfixed(11 downto 0);
    k4               : sfixed(11 downto 0);
    k5               : sfixed(11 downto 0);
    k6               : sfixed(11 downto 0);
    k7               : sfixed(11 downto 0);
    k8               : sfixed(11 downto 0);
    k9               : sfixed(11 downto 0);
end record;
type t20ksn is record
    k1               : sfixed(20 downto 0);
    k2               : sfixed(20 downto 0);
    k3               : sfixed(20 downto 0);
    k4               : sfixed(20 downto 0);
    k5               : sfixed(20 downto 0);
    k6               : sfixed(20 downto 0);
    k7               : sfixed(20 downto 0);
    k8               : sfixed(20 downto 0);
    k9               : sfixed(20 downto 0);
end record;
type t12ksn is record
    k1               : sfixed(11 downto 0);
    k2               : sfixed(11 downto 0);
    k3               : sfixed(11 downto 0);
    k4               : sfixed(11 downto 0);
    k5               : sfixed(11 downto 0);
    k6               : sfixed(11 downto 0);
    k7               : sfixed(11 downto 0);
    k8               : sfixed(11 downto 0);
    k9               : sfixed(11 downto 0);
    k10              : sfixed(11 downto 0);
    k11              : sfixed(11 downto 0);
    k12              : sfixed(11 downto 0);
    k13              : sfixed(11 downto 0);
    k14              : sfixed(11 downto 0);
    k15              : sfixed(11 downto 0);
    k16              : sfixed(11 downto 0);
end record;
type t12kksn is record
    k1               : sfixed(11 downto 0);
    k2               : sfixed(11 downto 0);
    k3               : sfixed(11 downto 0);
    k4               : sfixed(11 downto 0);
    k5               : sfixed(11 downto 0);
    k6               : sfixed(11 downto 0);
    k7               : sfixed(11 downto 0);
    k8               : sfixed(11 downto 0);
    k9               : sfixed(11 downto 0);
    k10              : sfixed(11 downto 0);
    k11              : sfixed(11 downto 0);
    k12              : sfixed(11 downto 0);
    k13              : sfixed(11 downto 0);
    k14              : sfixed(11 downto 0);
    k15              : sfixed(11 downto 0);
    k16              : sfixed(11 downto 0);
end record;
type t11ksn is record
    k1               : sfixed(10 downto 0);
    k2               : sfixed(10 downto 0);
    k3               : sfixed(10 downto 0);
    k4               : sfixed(10 downto 0);
    k5               : sfixed(10 downto 0);
    k6               : sfixed(10 downto 0);
    k7               : sfixed(10 downto 0);
    k8               : sfixed(10 downto 0);
    k9               : sfixed(10 downto 0);
end record;
type t11kksn is record
    k1               : sfixed(10 downto 0);
    k2               : sfixed(10 downto 0);
    k3               : sfixed(10 downto 0);
    k4               : sfixed(10 downto 0);
    k5               : sfixed(10 downto 0);
    k6               : sfixed(10 downto 0);
    k7               : sfixed(10 downto 0);
    k8               : sfixed(10 downto 0);
    k9               : sfixed(10 downto 0);
    k10              : sfixed(10 downto 0);
    k11              : sfixed(10 downto 0);
    k12              : sfixed(10 downto 0);
    k13              : sfixed(10 downto 0);
    k14              : sfixed(10 downto 0);
    k15              : sfixed(10 downto 0);
    k16              : sfixed(10 downto 0);
end record;
type tyksn is record
    k1               : sfixed(9 downto 0);
    k2               : sfixed(9 downto 0);
    k3               : sfixed(9 downto 0);
    k4               : sfixed(9 downto 0);
    k5               : sfixed(9 downto 0);
    k6               : sfixed(9 downto 0);
    k7               : sfixed(9 downto 0);
    k8               : sfixed(9 downto 0);
    k9               : sfixed(9 downto 0);
end record;
type ty2snRz is record
    k1               : signed(19 downto 0);
    k2               : signed(19 downto 0);
    k3               : signed(19 downto 0);
    k4               : signed(19 downto 0);
    k5               : signed(19 downto 0);
    k6               : signed(19 downto 0);
    k7               : signed(19 downto 0);
    k8               : signed(19 downto 0);
    k9               : signed(19 downto 0);
end record;
type k_3by3 is record
    row_1    : std_logic_vector(23 downto 0);
    row_2    : std_logic_vector(23 downto 0);
    row_3    : std_logic_vector(23 downto 0);
    row_4    : std_logic_vector(23 downto 0);
end record;
type ty2fl is record
    k1               : float32;
    k2               : float32;
    k3               : float32;
    k4               : float32;
    k5               : float32;
    k6               : float32;
    k7               : float32;
    k8               : float32;
    k9               : float32;
end record;
type ty2std is record
    k1               : sfixed(24 downto -3);
    k2               : sfixed(24 downto -3);
    k3               : sfixed(24 downto -3);
    k4               : sfixed(24 downto -3);
    k5               : sfixed(24 downto -3);
    k6               : sfixed(24 downto -3);
    k7               : sfixed(24 downto -3);
    k8               : sfixed(24 downto -3);
    k9               : sfixed(24 downto -3);
end record;
type kkCoeff is record
    k1               : std_logic_vector(7 downto 0);
    k2               : std_logic_vector(7 downto 0);
    k3               : std_logic_vector(7 downto 0);
    k4               : std_logic_vector(7 downto 0);
    k5               : std_logic_vector(7 downto 0);
    k6               : std_logic_vector(7 downto 0);
    k7               : std_logic_vector(7 downto 0);
    k8               : std_logic_vector(7 downto 0);
    k9               : std_logic_vector(7 downto 0);
end record;
type kkkCoeff is record
    k1               : std_logic_vector(7 downto 0);
    k2               : std_logic_vector(7 downto 0);
    k3               : std_logic_vector(7 downto 0);
    k4               : std_logic_vector(7 downto 0);
    k5               : std_logic_vector(7 downto 0);
    k6               : std_logic_vector(7 downto 0);
    k7               : std_logic_vector(7 downto 0);
    k8               : std_logic_vector(7 downto 0);
    k9               : std_logic_vector(7 downto 0);
    k10              : std_logic_vector(7 downto 0);
    k11              : std_logic_vector(7 downto 0);
    k12              : std_logic_vector(7 downto 0);
    k13              : std_logic_vector(7 downto 0);
    k14              : std_logic_vector(7 downto 0);
    k15              : std_logic_vector(7 downto 0);
    k16              : std_logic_vector(7 downto 0);
end record;
type rgbSnSumTrRecord is record
    red              : signed(12 downto 0);
    green            : signed(12 downto 0);
    blue             : signed(12 downto 0);
end record;
type rgbToSfRecord is record
    red              : sfixed(9 downto 0);
    green            : sfixed(9 downto 0);
    blue             : sfixed(9 downto 0);
end record;
type rgbToSf12Record is record
    red              : sfixed(11 downto 0);
    green            : sfixed(11 downto 0);
    blue             : sfixed(11 downto 0);
end record;
type rgbSnSumRecord is record
    red              : signed(ADD_RESULT_WIDTH-1 downto 0);
    green            : signed(ADD_RESULT_WIDTH-1 downto 0);
    blue             : signed(ADD_RESULT_WIDTH-1 downto 0);
end record;
type ccRgbRecord is record
    rgbToSf          : rgbToSfRecord;
    rgbSnSum         : rgbSnSumRecord;
    rgbSnSumTr       : rgbSnSumTrRecord;
end record;
type rgbToFlRecord is record
    red              : float32;
    green            : float32;
    blue             : float32;
end record;
type ccRgbFlRecord is record
    rgbToFl          : rgbToFlRecord;
end record;
type tpToFloatRecord is record
    red              : float32;
    green            : float32;
    blue             : float32;
    valid            : std_logic;
end record;
type rgbToFloatRecord is record
    red              : float32;
    green            : float32;
    blue             : float32;
end record;
type rgbToSnSumRecord is record
    red              : signed(ADD_RESULT_WIDTH-1 downto 0);
    green            : signed(ADD_RESULT_WIDTH-1 downto 0);
    blue             : signed(ADD_RESULT_WIDTH-1 downto 0);
end record;
type rgbToSnSumTrRecord is record
    red              : signed(12 downto 0);
    green            : signed(12 downto 0);
    blue             : signed(12 downto 0);
end record;
type tapsFl is record
  vTap0x              : float32;
  vTap1x              : float32;
  vTap2x              : float32;
end record;
type tps is record
  vTap0x              : std_logic_vector(31 downto 0);
  vTap1x              : std_logic_vector(31 downto 0);
  vTap2x              : std_logic_vector(31 downto 0);
end record;
type ccRecord is record
    tpsd1            : tps;
    tpsd2            : tps;
    tpsd3            : tps;
end record;
type TapsRecord is record
    tpsd1            : tps;
    tpsd2            : tps;
    tpsd3            : tps;
end record;

type rgb_deltas is record
    delta               : t12ksn;
    delta_1syn          : t12ksn;
    delta_2syn          : t12ksn;
end record;



type rgb_delta is record
    delta               : t12ksn;
    delta_1syn          : t12ksn;
    delta_2syn          : t12ksn;
    delta_sum_0         : t11ksn;
    delta_sum_1         : t15b3ksn;
    delta_sum_2         : t15b3ksn;
    delta_sum_3         : t15b3ksn;
    delta_sum_prod_0    : t15b3ksn;
    delta_sum_prod_1    : t15b3ksn;
    delta_sum_prod_2    : t15b3ksn;
    delta_sum_prod_3    : t15b3ksn;
end record;
type type_valid_kn is
record
    n                : natural;
end record;
type type_valid_k is array(natural range <>) of type_valid_kn;
type rgb_sumprod is record
  sumprod_2         : t14b4ksn;
  sumprod_2n        : t14b4ksn;
  sumprod_3n        : t14b4ksn;
  sumprod_4n        : t14b4ksn;
  sumprod_5n        : t14b4ksn;
  sumprod_6n        : t14b4ksn;
  sumprod_7n        : t14b4ksn;
  sumprod_8n        : t14b4ksn;
  sumprod_9n        : t14b4ksn;
  sumprod_An        : t14b4ksn;
  sumprod_Bn        : t14b4ksn;
  sumprod_Cn        : t14b4ksn;
  
  
  add_12            : sfixed(17 downto -2);
  add_s12           : sfixed(17 downto -2);
  add_16            : sfixed(17 downto -2);
  add_s16           : sfixed(17 downto -2);
  add_113           : sfixed(17 downto -2);
  add_s113          : sfixed(17 downto -2);
  add_s1245         : sfixed(18 downto -2);
  add_sp1245        : sfixed(23 downto -5);
  sp1245            : sfixed(18 downto -2);
  add_34            : sfixed(17 downto -2);
  add_56            : sfixed(17 downto -2);
  add_78            : sfixed(17 downto -2);
  add_s34           : sfixed(17 downto -2);
  add_s56           : sfixed(17 downto -2);
  add_s78           : sfixed(17 downto -2);
  add_1234          : sfixed(18 downto -2);
  add_5678          : sfixed(18 downto -2);
  add_s1234         : sfixed(18 downto -2);
  add_s5678         : sfixed(18 downto -2);
  add_1_to_8        : sfixed(19 downto -2);
  add_s1_to_8       : sfixed(19 downto -2);
  sp1_to_8          : sfixed(19 downto -5);
  add_s9            : sfixed(19 downto -5);
  add_1to8sp        : sfixed(24 downto -5);
  add_45            : sfixed(17 downto -2);
  add_s45           : sfixed(17 downto -2);
  add_14            : sfixed(17 downto -2);
  add_s14           : sfixed(17 downto -2);
  add_17            : sfixed(17 downto -2);
  add_s17           : sfixed(17 downto -2);
  add_13            : sfixed(17 downto -2);
  add_s13           : sfixed(17 downto -2);
  add_15            : sfixed(17 downto -2);
  add_s15           : sfixed(17 downto -2);
  add_125           : sfixed(18 downto -2);
  add_123           : sfixed(18 downto -2);
  add_124           : sfixed(18 downto -2);
  add_147           : sfixed(18 downto -2);
  add_145           : sfixed(18 downto -2);
  add_1245          : sfixed(18 downto -2);
  add_1316          : sfixed(18 downto -2);
  add_s1316         : sfixed(18 downto -2);
  add_141316        : sfixed(18 downto -2);
  add_s141316       : sfixed(18 downto -2);
  add_s125          : sfixed(18 downto -2);
  add_sp125         : sfixed(23 downto -5);
  sp125             : sfixed(18 downto -2);
  add_s123          : sfixed(18 downto -2);
  add_sp123         : sfixed(23 downto -5);
  sp123             : sfixed(18 downto -2);
  add_s124          : sfixed(18 downto -2);
  add_sp124         : sfixed(23 downto -5);
  sp124             : sfixed(18 downto -2);
  add_s147          : sfixed(18 downto -2);
  add_sp147         : sfixed(23 downto -5);
  sp147             : sfixed(18 downto -2);
  add_s145          : sfixed(18 downto -2);
  add_sp145         : sfixed(23 downto -5);
  sp145             : sfixed(18 downto -2);
  result            : std_logic_vector(7 downto 0);
  kkk               : type_valid_k(0 to 9);
  kk                : type_valid_k(0 to 9);
  k                 : type_valid_k(0 to 9);
  k_syn_1           : type_valid_k(0 to 9);
  k_syn_2           : type_valid_k(0 to 9);
  k_syn_3           : type_valid_k(0 to 9);
  k_syn_4           : type_valid_k(0 to 9);
  k_syn_5           : type_valid_k(0 to 9);
  k_syn_6           : type_valid_k(0 to 9);
  k_syn_7           : type_valid_k(0 to 9);
  k_syn_8           : type_valid_k(0 to 9);
  k_syn_9           : type_valid_k(0 to 9);
  k_syn_10          : type_valid_k(0 to 9);
  k_syn_11          : type_valid_k(0 to 9);
  k_syn_12          : type_valid_k(0 to 9);
end record;
type sf_bits is record
  k1                : sfixed(9 downto 0);
  k2                : sfixed(9 downto 0);
  k3                : sfixed(9 downto 0);
  k4                : sfixed(9 downto 0);
  k5                : sfixed(9 downto 0);
  k6                : sfixed(9 downto 0);
  k7                : sfixed(9 downto 0);
  k8                : sfixed(9 downto 0);
  k9                : sfixed(9 downto 0);
  k10               : sfixed(9 downto 0);
  k11               : sfixed(9 downto 0);
  k12               : sfixed(9 downto 0);
  k13               : sfixed(9 downto 0);
  k14               : sfixed(9 downto 0);
  k15               : sfixed(9 downto 0);
  k16               : sfixed(9 downto 0);
end record;
type rgbSumProd is record
  k1                : sfixed(9 downto 0);
  k2                : sfixed(9 downto 0);
  k3                : sfixed(9 downto 0);
  k4                : sfixed(9 downto 0);
  k5                : sfixed(9 downto 0);
  k6                : sfixed(9 downto 0);
  k7                : sfixed(9 downto 0);
  k8                : sfixed(9 downto 0);
  k9                : sfixed(9 downto 0);
  k10               : sfixed(9 downto 0);
  k11               : sfixed(9 downto 0);
  k12               : sfixed(9 downto 0);
  k13               : sfixed(9 downto 0);
  k14               : sfixed(9 downto 0);
  k15               : sfixed(9 downto 0);
  k16               : sfixed(9 downto 0);
  delta             : t12kksn;
  delta_1syn        : t12kksn;
  delta_2syn        : t12kksn;
  delta_sum_0       : t11kksn;
  delta_sum_1       : t11kksn;
  delta_sum_2       : t11kksn;
  delta_sum_3       : t11kksn;
  delta_sum_prod_0  : t15b3kksn;
  delta_sum_prod_1  : t15b3kksn;
end record;
type rgb_sum_prod is record
  sumprod_2         : t15b3kksn;
  sumprod_2n        : t15b3kksn;
  sumprod_3n        : t15b3kksn;
  sumprod_4n        : t15b3kksn;
  sumprod_5n        : t15b3kksn;
  sumprod_6n        : t15b3kksn;
  sumprod_7n        : t15b3kksn;
  sumprod_8n        : t15b3kksn;
  sumprod_9n        : t15b3kksn;
  sumprod_An        : k16natrual;
  sumprod_Bn        : k16natrual;
  sumprod_Cn        : k16natrual;
  result            : std_logic_vector(13 downto 0);
end record;
type rgb_add_range is record
  add_256            : natural;
  add_16             : natural;
  add_s16            : natural;
  add_113            : natural;
  add_s113           : natural;
  add_116            : natural;
  add_s116           : natural;
  add_1316           : natural;
  add_s1316          : natural;
  add_141316         : natural;
  add_s141316        : natural;
  add_12345678       : natural;
  add_9ABCDEFF       : natural;
  add_123456789ABCDEFF : natural;
  add_12             : natural;
  add_34             : natural;
  add_56             : natural;
  add_78             : natural;
  add_s12            : natural;
  add_s34            : natural;
  add_s56            : natural;
  add_s78            : natural;
  add_1234           : natural;
  add_5678           : natural;
  add_s1234          : natural;
  add_s5678          : natural;
  add_1_to_8         : natural;
  add_s1_to_8        : natural;
  add_s9             : natural;
  add_1to8sp         : natural;
  add_45             : natural;
  add_s45            : natural;
  add_14             : natural;
  add_s14            : natural;
  add_79             : natural;
  add_s79            : natural;
  add_17             : natural;
  add_s17            : natural;
  add_13             : natural;
  add_s13            : natural;
  add_15             : natural;
  add_s15            : natural;
  add_125            : natural;
  add_123            : natural;
  add_124            : natural;
  add_147            : natural;
  add_145            : natural;
  add_1245           : natural;
  add_s1245          : natural;
  add_sp1245         : natural;
  add_1379           : natural;
  add_s1379          : natural;
  add_sp1379         : natural;
  add_s125           : natural;
  add_sp125          : natural;
  add_s123           : natural;
  add_sp123          : natural;
  add_s124           : natural;
  add_sp124          : natural;
  add_s147           : natural;
  add_sp147          : natural;
  add_s145           : natural;
  add_sp145          : natural;
  add_1256           : natural;
  add_125639         : natural;
  add_1256394        : natural;
  add_125639_13      : natural;
  add_1256394_13     : natural;
  add_12563947_13_10 : natural;
end record;
type rgb_detect_kernal is record
    k                 : type_valid_k(0 to 16);
    k_syn_1           : type_valid_k(0 to 16);
    k_syn_2           : type_valid_k(0 to 16);
    k_syn_3           : type_valid_k(0 to 16);
    k_syn_4           : type_valid_k(0 to 16);
    k_syn_5           : type_valid_k(0 to 16);
    k_syn_6           : type_valid_k(0 to 16);
    k_syn_7           : type_valid_k(0 to 16);
    k_syn_8           : type_valid_k(0 to 16);
    k_syn_9           : type_valid_k(0 to 16);
    k_syn_10          : type_valid_k(0 to 16);
    k_syn_11          : type_valid_k(0 to 16);
    k_syn_12          : type_valid_k(0 to 16);
end record;
type snFixedResizeRecord is record
    fxToSnFxProd     : ty2std;
    snFxToSnProd     : ty2snRz;
    snToTrimProd     : ty1sn;
    snSum            : rgbToSnSumRecord;
end record;
type filtersCoefRecord is record
    flCoef           : ty2fl;
    flCoefFract      : ty2fl;
end record;
type filtersRecord is record
    rgbToFl          : rgbToFloatRecord;
    flProd           : ty2fl;
    flToSnFxProd     : ty2std;
    snFxToSnProd     : ty2snRz;
    snToTrimProd     : ty1sn;
    snSum            : rgbToSnSumRecord;
    snToTrimSum      : rgbToSnSumTrRecord;
    tpd1             : tapsFl;
    tpd2             : tapsFl;
    tpd3             : tapsFl;
    rgbSum           : signed(12 downto 0);
end record;
type SobelRecord is record
    flProd           : ty2fl;
    flCoef           : ty2fl;
    flCoefFract      : ty2fl;
    flToSnFxProd     : ty2std;
    snFxToSnProd     : ty2snRz;
    snToTrimProd     : ty1sn;
    snSum            : rgbToSnSumRecord;
    snToTrimSum      : rgbToSnSumTrRecord;
    tpd1             : tapsFl;
    tpd2             : tapsFl;
    tpd3             : tapsFl;
    rgbSum           : signed(12 downto 0);
end record;
-----------------------------------------------------
type rgbToUfRecord is record
    valid            : std_logic;
    red              : ufixed(7 downto 0);
    green            : ufixed(7 downto 0);
    blue             : ufixed(7 downto 0);
end record;
type rgb_to_uf_record is record
    valid            : std_logic;
    red              : ufixed(0 downto -8);
    green            : ufixed(0 downto -8);
    blue             : ufixed(0 downto -8);
end record;
type rgbToUf1Record is record
    valid            : std_logic;
    red              : ufixed(8 downto 0);
    green            : ufixed(8 downto 0);
    blue             : ufixed(8 downto 0);
end record;
type rgbToUf18Record is record
    valid            : std_logic;
    red              : ufixed(17 downto 0);
    green            : ufixed(17 downto 0);
    blue             : ufixed(17 downto 0);
end record;
type rgbToUf16Record is record
    valid            : std_logic;
    red              : ufixed(15 downto 0);
    green            : ufixed(15 downto 0);
    blue             : ufixed(15 downto 0);
end record;
type rgbToUfn16Record is record
    valid            : std_logic;
    red              : ufixed(15 downto -8);
    green            : ufixed(15 downto -8);
    blue             : ufixed(15 downto -8);
end record;
type rgbToUfn14Record is record
    valid            : std_logic;
    red              : ufixed(-1 downto -16);
    green            : ufixed(-1 downto -16);
    blue             : ufixed(-1 downto -16);
end record;
type rgbToUfn7Record is record
    valid            : std_logic;
    red              : ufixed(8 downto -9);
    green            : ufixed(8 downto -9);
    blue             : ufixed(8 downto -9);
end record;
type rgbToUfn17Record is record
    valid            : std_logic;
    red              : ufixed(12 downto -3);
    green            : ufixed(12 downto -3);
    blue             : ufixed(12 downto -3);
end record;
type rgbToUfn18Record is record
    valid            : std_logic;
    red              : ufixed(13 downto -2);
    green            : ufixed(13 downto -2);
    blue             : ufixed(13 downto -2);
end record;
type rgbToUf25Record is record
    valid            : std_logic;
    red              : ufixed(24 downto 0);
    green            : ufixed(24 downto 0);
    blue             : ufixed(24 downto 0);
end record;
type rgbToUf2BytesRecord is record
    red              : ufixed(15 downto 0);
    green            : ufixed(15 downto 0);
    blue             : ufixed(15 downto 0);
    valid            : std_logic;
end record;
type channel is record
    valid            : std_logic;
    red              : std_logic_vector(7 downto 0);
    green            : std_logic_vector(7 downto 0);
    blue             : std_logic_vector(7 downto 0);
end record;
type channel_9bi is record
    valid            : std_logic;
    red              : std_logic_vector(8 downto 0);
    green            : std_logic_vector(8 downto 0);
    blue             : std_logic_vector(8 downto 0);
end record;
type rgbFloat is record
    valid            : std_logic;
    red              : std_logic_vector(31 downto 0);
    green            : std_logic_vector(31 downto 0);
    blue             : std_logic_vector(31 downto 0);
end record;
type colors is record
    sobel          : channel;
    embos          : channel;
    blur           : channel;
    sharp          : channel;
    cgain          : channel;
    cgain2         : channel;
    ycbcr          : channel;
    hsl            : channel;
    hsv            : channel;
    inrgb          : channel;
    tPattern       : channel;
    colorTrm       : channel;
    colorhsl       : channel;
    hsl1_range     : channel;
    hsl2_range     : channel;
    hsl3_range     : channel;
    hsl4_range     : channel;
    hsll1range     : channel;
    hsll2range     : channel;
    hsll3range     : channel;
    hsll4range     : channel;
    re1color       : channel;
    re2color       : channel;
    re3color       : channel;
    re4color       : channel;
    re5color       : channel;
    re6color       : channel;
    re7color       : channel;
    re8color       : channel;
    colorLmp       : channel;
end record;
type local_filters is record
    blur           : channel;
    sharp          : channel;
    cgain          : channel;
    ycbcr          : channel;
    lcobj          : channel;
    rgbag          : channel;
end record;
type blur_frames is record
    ditRgb1vx           : channel;
    ditRgb2vx           : channel;
    ditRgb3vx           : channel;
    blur1vx             : channel;
    blur2vx             : channel;
    blur3vx             : channel;
end record;
type space_limits is record
    ch0                 : channel;
    ch1                 : channel;
    ch2                 : channel;
    ch3                 : channel;
    ch4                 : channel;
    ch5                 : channel;
    ch6                 : channel;
    ch7                 : channel;
end record;
type frameColors is record
    sobel             : channel;
    embos             : channel;
    blur              : channel;
    sharp             : channel;
    cgain             : channel;
    cgain2            : channel;
    ycbcr             : channel;
    hsl               : channel;
    hsv               : channel;
    inrgb             : channel;
    d1t               : channel;
    b1t               : channel;
    vhsv              : channel;
    colorhsl          : channel;
    hsl1_range        : channel;
    hsl2_range        : channel;
    hsl3_range        : channel;
    hsl4_range        : channel;
    hsll1range        : channel;
    hsll2range        : channel;
    hsll3range        : channel;
    hsll4range        : channel;
    re1color          : channel;
    re2color          : channel;
    re3color          : channel;
    re4color          : channel;
    re5color          : channel;
    re6color          : channel;
    re7color          : channel;
    re8color          : channel;
    histogram         : channel;
    hsvl              : channel;
    eObject           : channel;
    space             : space_limits;
    blur1vx           : channel;
    blur2vx           : channel;
    blur3vx           : channel;
    maskSobelLum      : channel;
    maskSobelTrm      : channel;
    maskSobelRgb      : channel;
    maskSobelShp      : channel;
    maskSobelBlu      : channel;
    maskSobelYcc      : channel;
    maskSobelHsv      : channel;
    maskSobelHsl      : channel;
    maskSobelCga      : channel;
    colorTrm          : channel;
    colorLmp          : channel;
    tPattern          : channel;
    cgainToCgain      : channel;
    cgainToHsl        : channel;
    cgainToHsv        : channel;
    cgainToYcbcr      : channel;
    cgainToShp        : channel;
    cgainToBlu        : channel;
    shpToCgain        : channel;
    shpToHsl          : channel;
    shpToHsv          : channel;
    shpToYcbcr        : channel;
    shpToShp          : channel;
    shpToBlu          : channel;
    bluToBlu          : channel;
    bluToCga          : channel;
    bluToShp          : channel;
    bluToYcc          : channel;
    bluToHsv          : channel;
    bluToHsl          : channel;
    bluToCgaShp       : channel;
    bluToCgaShpYcc    : channel;
    bluToCgaShpHsv    : channel;
    bluToShpCga       : channel;
    bluToShpCgaYcc    : channel;
    bluToShpCgaHsv    : channel;
    cgaBright         : channel;
    cgaDark           : channel;
    cgaBalance        : channel;
    cgaGainRed        : channel;
    cgaGainGre        : channel;
    cgaGainBlu        : channel;
    synBlur           : channel;
    synSharp          : channel;
    synCgain          : channel;
    synYcbcr          : channel;
    synLcobj          : channel;
    synRgbag          : channel;
end record;
type tpChannels is record
    valid            : std_logic;
    red              : std_logic_vector(23 downto 0);
    green            : std_logic_vector(23 downto 0);
    blue             : std_logic_vector(23 downto 0);
end record;
type tpRgb is record
    valid            : std_logic;
    red              : std_logic_vector(11 downto 0);
    green            : std_logic_vector(11 downto 0);
    blue             : std_logic_vector(11 downto 0);
end record;
type uChannel is record
    valid            : std_logic;
    red              : unsigned(7 downto 0);
    green            : unsigned(7 downto 0);
    blue             : unsigned(7 downto 0);
end record;
type mChannel is record
    red              : unsigned(8 downto 0);
    green            : unsigned(8 downto 0);
    blue             : unsigned(8 downto 0);
end record;
type m9xChannel is record
    valid            : std_logic;
    red              : unsigned(15 downto 0);
    green            : unsigned(15 downto 0);
    blue             : unsigned(15 downto 0);
end record;
type intChannel is record
    red              : natural;
    green            : natural;
    blue             : natural;
    valid            : std_logic;
end record;
type blurchannel is record
    valid            : std_logic;
    red              : std_logic_vector(11 downto 0);
    green            : std_logic_vector(11 downto 0);
    blue             : std_logic_vector(11 downto 0);
end record;
type intersectPoint is record
    lft              : integer;
    rht              : integer;
    top              : integer;
    bot              : integer;
end record;
type hsvChannel is record
    valid            : std_logic;
    h                : std_logic_vector(7 downto 0);
    s                : std_logic_vector(7 downto 0);
    v                : std_logic_vector(7 downto 0);
end record;
type hslChannel is record
    valid            : std_logic;
    h                : std_logic_vector(7 downto 0);
    s                : std_logic_vector(7 downto 0);
    l                : std_logic_vector(7 downto 0);
end record;
type coord is record
    x                : std_logic_vector(15 downto 0);
    y                : std_logic_vector(15 downto 0);
end record;
type cord is record
    x                : natural;
    y                : natural;
end record;
type coefficient is record
    k1               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k2               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k3               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k4               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k5               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k6               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k7               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k8               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    k9               : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    config           : integer;
end record;
type kernelCoeff is record
    k1               : std_logic_vector(15 downto 0);
    k2               : std_logic_vector(15 downto 0);
    k3               : std_logic_vector(15 downto 0);
    k4               : std_logic_vector(15 downto 0);
    k5               : std_logic_vector(15 downto 0);
    k6               : std_logic_vector(15 downto 0);
    k7               : std_logic_vector(15 downto 0);
    k8               : std_logic_vector(15 downto 0);
    k9               : std_logic_vector(15 downto 0);
    kSet             : integer;
end record;
type kernelCoeDWord  is record
    k1               : std_logic_vector(31 downto 0);
    k2               : std_logic_vector(31 downto 0);
    k3               : std_logic_vector(31 downto 0);
    k4               : std_logic_vector(31 downto 0);
    k5               : std_logic_vector(31 downto 0);
    k6               : std_logic_vector(31 downto 0);
    k7               : std_logic_vector(31 downto 0);
    k8               : std_logic_vector(31 downto 0);
    k9               : std_logic_vector(31 downto 0);
    kSet             : integer;
end record;
type kCoeffFloat    is record
    k1               : std_logic_vector(27 downto 0);
    k2               : std_logic_vector(27 downto 0);
    k3               : std_logic_vector(27 downto 0);
    k4               : std_logic_vector(27 downto 0);
    k5               : std_logic_vector(27 downto 0);
    k6               : std_logic_vector(27 downto 0);
    k7               : std_logic_vector(27 downto 0);
    k8               : std_logic_vector(27 downto 0);
    k9               : std_logic_vector(27 downto 0);
    kSet             : integer;
end record;
type coeffData is record
    k1               : real;
    k2               : real;
    k3               : real;
    k4               : real;
    k5               : real;
    k6               : real;
    k7               : real;
    k8               : real;
    k9               : real;
end record;
type coeffIntegerData is record
    k1               : integer;
    k2               : integer;
    k3               : integer;
    k4               : integer;
    k5               : integer;
    k6               : integer;
    k7               : integer;
    k8               : integer;
    k9               : integer;
    kSet             : integer;
end record;
type region is record
    rl               : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    rh               : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    gl               : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    gh               : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
    bl               : std_logic_vector(i_data_width-1 downto 0);-- :=x"0A";
    bh               : std_logic_vector(i_data_width-1 downto 0);-- :=x"50";
end record;
type poi is record
    pointInterest    : integer;
    deltaConfig      : integer;
    cpuAckGoAgain    : std_logic;
    cpuWgridLock     : std_logic;
    cpuAckoffFrame   : std_logic;
    fifoReadAddress  : std_logic_vector(13 downto 0);
    fifoReadEnable   : std_logic;
    clearFifoData    : std_logic;
end record;
type rawRgb is record
    red              : unsigned(11 downto 0);
    green            : unsigned(12 downto 0);
    blue             : unsigned(11 downto 0);
end record;
type tp is record
    tp1              : std_logic_vector(11 downto 0);
    tp2              : std_logic_vector(11 downto 0);
    tp3              : std_logic_vector(11 downto 0);
end record;
type uTp is record
    tp1              : unsigned(11 downto 0);
    tp2              : unsigned(11 downto 0);
    tp3              : unsigned(11 downto 0);
end record;
type vStreamData is record
    eof              : std_logic;
    sof              : std_logic;
    ycbcr            : channel;
    cord             : coord;
end record;
type rData is record
    pEof             : std_logic;
    pSof             : std_logic;
    valid            : std_logic;
    data             : std_logic_vector(11 downto 0);
    cord             : coord;
end record;
type rTp is record
    pEof             : std_logic;
    pSof             : std_logic;
    valid            : std_logic;
    taps             : tp;
    cord             : coord;
end record;

type w_pixels is record
    pix1 : unsigned(i_data_width downto 0);
    pix2 : unsigned(i_data_width downto 0);
    pix3 : unsigned(i_data_width downto 0);
    pix4 : unsigned(i_data_width downto 0);
    pix5 : unsigned(i_data_width downto 0);
    pix6 : unsigned(i_data_width downto 0);
    pix7 : unsigned(i_data_width downto 0);
    pix8 : unsigned(i_data_width downto 0);
    pix9 : unsigned(i_data_width downto 0);
end record;

type w_4_by_4_pixels is record
    k1  : unsigned(i_data_width downto 0);
    k2  : unsigned(i_data_width downto 0);
    k3  : unsigned(i_data_width downto 0);
    k4  : unsigned(i_data_width downto 0);
    k5  : unsigned(i_data_width downto 0);
    k6  : unsigned(i_data_width downto 0);
    k7  : unsigned(i_data_width downto 0);
    k8  : unsigned(i_data_width downto 0);
    k9  : unsigned(i_data_width downto 0);
    k10 : unsigned(i_data_width downto 0);
    k11 : unsigned(i_data_width downto 0);
    k12 : unsigned(i_data_width downto 0);
    k13 : unsigned(i_data_width downto 0);
    k14 : unsigned(i_data_width downto 0);
    k15 : unsigned(i_data_width downto 0);
    k16 : unsigned(i_data_width downto 0);
end record;

type w_3_by_3_pixels is record
    k1  : unsigned(23 downto 0);
    k2  : unsigned(23 downto 0);
    k3  : unsigned(23 downto 0);
    k4  : unsigned(23 downto 0);
    k5  : unsigned(23 downto 0);
    k6  : unsigned(23 downto 0);
    k7  : unsigned(23 downto 0);
    k8  : unsigned(23 downto 0);
    k9  : unsigned(23 downto 0);
end record;

type w_3_by_3_pixels_28_width is record
    k1  : unsigned(31 downto 0);
    k2  : unsigned(31 downto 0);
    k3  : unsigned(31 downto 0);
    k4  : unsigned(31 downto 0);
    k5  : unsigned(31 downto 0);
    k6  : unsigned(31 downto 0);
    k7  : unsigned(31 downto 0);
    k8  : unsigned(31 downto 0);
    k9  : unsigned(31 downto 0);
end record;

type itaps is record
    iTap1  : unsigned(i_data_width downto 0);
    iTap2  : unsigned(i_data_width downto 0);
    iTap3  : unsigned(i_data_width downto 0);
end record;
type unsig_pixel_mac is record
    m1      : unsigned (16 downto 0);
    m2      : unsigned (16 downto 0);
    m3      : unsigned (16 downto 0);
    mac     : unsigned (i_data_width+3 downto 0);
end record;

type unsig_pixel_4by4mac is record
    m1      : unsigned (16 downto 0);
    m2      : unsigned (16 downto 0);
    m3      : unsigned (16 downto 0);
    m4      : unsigned (16 downto 0);
    mac     : unsigned (i_data_width+3 downto 0);
end record;


type fcolors is record
    sobel             : channel;
    embos             : channel;
    blur              : channel;
    sharp             : channel;
    cgain             : channel;
    cgain2            : channel;
    ycbcr             : channel;
    hsl               : channel;
    hsv               : channel;
    inrgb             : channel;
    colorhsl          : channel;
    hsl1_range        : channel;
    hsl2_range        : channel;
    hsl3_range        : channel;
    hsl4_range        : channel;
    hsll1range        : channel;
    hsll2range        : channel;
    hsll3range        : channel;
    hsll4range        : channel;
    re1color          : channel;
    re2color          : channel;
    re3color          : channel;
    re4color          : channel;
    re5color          : channel;
    re6color          : channel;
    re7color          : channel;
    re8color          : channel;
    maskSobelLum      : channel;
    maskSobelTrm      : channel;
    maskSobelRgb      : channel;
    maskSobelShp      : channel;
    maskSobelBlu      : channel;
    maskSobelYcc      : channel;
    maskSobelHsv      : channel;
    maskSobelHsl      : channel;
    maskSobelCga      : channel;
    colorTrm          : channel;
    colorLmp          : channel;
    tPattern          : channel;
    cgainToCgain      : channel;
    cgainToHsl        : channel;
    cgainToHsv        : channel;
    cgainToYcbcr      : channel;
    cgainToShp        : channel;
    cgainToBlu        : channel;
    shpToCgain        : channel;
    shpToHsl          : channel;
    shpToHsv          : channel;
    shpToYcbcr        : channel;
    shpToShp          : channel;
    shpToBlu          : channel;
    bluToBlu          : channel;
    bluToCga          : channel;
    bluToShp          : channel;
    bluToYcc          : channel;
    bluToHsv          : channel;
    bluToHsl          : channel;
    bluToCgaShp       : channel;
    bluToCgaShpYcc    : channel;
    bluToCgaShpHsv    : channel;
    bluToShpCga       : channel;
    bluToShpCgaYcc    : channel;
    bluToShpCgaHsv    : channel;
    rgbCorrect        : channel;
    rgbRemix          : channel;
    rgbDetect         : channel;
    rgbPoi            : channel;
    rgbSum            : tpRgb;
    cod               : coord;
    rgbDetectLock     : std_logic;
    rgbPoiLock        : std_logic;
    pEof              : std_logic;
    pSof              : std_logic;
end record;
type mRegs is record
    cfigReg0         : std_logic_vector(31 downto 0);
    cfigReg1         : std_logic_vector(31 downto 0);
    cfigReg2         : std_logic_vector(31 downto 0);
    cfigReg3         : std_logic_vector(31 downto 0);
    cfigReg4         : std_logic_vector(31 downto 0);
    cfigReg5         : std_logic_vector(31 downto 0);
    cfigReg6         : std_logic_vector(31 downto 0);
    cfigReg7         : std_logic_vector(31 downto 0);
    cfigReg8         : std_logic_vector(31 downto 0);
    cfigReg9         : std_logic_vector(31 downto 0);
    cfigReg10        : std_logic_vector(31 downto 0);
    cfigReg11        : std_logic_vector(31 downto 0);
    cfigReg12        : std_logic_vector(31 downto 0);
    cfigReg13        : std_logic_vector(31 downto 0);
    cfigReg14        : std_logic_vector(31 downto 0);
    cfigReg15        : std_logic_vector(31 downto 0);
    cfigReg16        : std_logic_vector(31 downto 0);
    cfigReg17        : std_logic_vector(31 downto 0);
    cfigReg18        : std_logic_vector(31 downto 0);
    cfigReg19        : std_logic_vector(31 downto 0);
    cfigReg20        : std_logic_vector(31 downto 0);
    cfigReg21        : std_logic_vector(31 downto 0);
    cfigReg22        : std_logic_vector(31 downto 0);
    cfigReg23        : std_logic_vector(31 downto 0);
    cfigReg24        : std_logic_vector(31 downto 0);
    cfigReg25        : std_logic_vector(31 downto 0);
    cfigReg26        : std_logic_vector(31 downto 0);
    cfigReg27        : std_logic_vector(31 downto 0);
    cfigReg28        : std_logic_vector(31 downto 0);
    cfigReg29        : std_logic_vector(31 downto 0);
    cfigReg30        : std_logic_vector(31 downto 0);
    cfigReg31        : std_logic_vector(31 downto 0);
    cfigReg32        : std_logic_vector(31 downto 0);
    cfigReg33         : std_logic_vector(31 downto 0);
    cfigReg34         : std_logic_vector(31 downto 0);
    cfigReg35         : std_logic_vector(31 downto 0);
    cfigReg36         : std_logic_vector(31 downto 0);
    cfigReg37         : std_logic_vector(31 downto 0);
    cfigReg38         : std_logic_vector(31 downto 0);
    cfigReg39         : std_logic_vector(31 downto 0);
    cfigReg40         : std_logic_vector(31 downto 0);
    cfigReg41         : std_logic_vector(31 downto 0);
    cfigReg42         : std_logic_vector(31 downto 0);
    cfigReg43         : std_logic_vector(31 downto 0);
    cfigReg44         : std_logic_vector(31 downto 0);
    cfigReg45         : std_logic_vector(31 downto 0);
    cfigReg46         : std_logic_vector(31 downto 0);
    cfigReg47         : std_logic_vector(31 downto 0);
    cfigReg48         : std_logic_vector(31 downto 0);
    cfigReg49         : std_logic_vector(31 downto 0);
    cfigReg50         : std_logic_vector(31 downto 0);
    cfigReg51         : std_logic_vector(31 downto 0);
    cfigReg52         : std_logic_vector(31 downto 0);
    cfigReg53         : std_logic_vector(31 downto 0);
    cfigReg54         : std_logic_vector(31 downto 0);
    cfigReg55         : std_logic_vector(31 downto 0);
    cfigReg56         : std_logic_vector(31 downto 0);
    cfigReg57         : std_logic_vector(31 downto 0);
    cfigReg58         : std_logic_vector(31 downto 0);
    cfigReg59         : std_logic_vector(31 downto 0);
    cfigReg60         : std_logic_vector(31 downto 0);
    cfigReg61         : std_logic_vector(31 downto 0);
    cfigReg62         : std_logic_vector(31 downto 0);
    cfigReg63         : std_logic_vector(31 downto 0);
end record;
type detap is record
    vTap0x           : signed(i_data_width downto 0);
    vTap1x           : signed(i_data_width downto 0);
    vTap2x           : signed(i_data_width downto 0);
end record;
type s_pixel is record
    m1               : signed (17 downto 0);
    m2               : signed (17 downto 0);
    m3               : signed (17 downto 0);
    mac              : signed (16 downto 0);
end record;
type presults is record
    pax              : signed (16 downto 0);
    pay              : signed (16 downto 0);
    mx               : signed (34 downto 0);
    my               : signed (34 downto 0);
    sxy              : signed (34 downto 0);
    sqr              : std_logic_vector (31 downto 0);
    edgeValid        : std_logic;
    sbof             : std_logic_vector (31 downto 0);
end record;
type rgbConstraint is record
    rl            : integer;
    rh            : integer;
    gl            : integer;
    gh            : integer;
    bl            : integer;
    bh            : integer;
end record;
type type_inRgb is
record
    valid            : std_logic;
    red              : integer;
    green            : integer;
    blue             : integer;
end record;
type type_inRgbArray is array(natural range <>) of type_inRgb;
type type_Rgb is
record
    valid            : std_logic;
    red              : rgb_u8bits;
    green            : rgb_u8bits;
    blue             : rgb_u8bits;
end record;
type type_RgbArray is array(natural range <>) of type_Rgb;
type type_line is
record
    pix              : std_logic_vector (7 downto 0);
end record;
type type_line_array is array(natural range <>) of type_line;
type pix_line is
record
    red              : natural;
    green            : natural;
    blue             : natural;
end record;
type pix_line_array is array(natural range <>) of pix_line;
type type_RgbChannel is
record
    rgb              : channel;
end record;
type rgbArray is array(natural range <>) of type_RgbChannel;
type type_cordChannel is
record
    xy               : cord;
    rgb              : channel;
end record;
type type_cord is array(natural range <>) of type_cordChannel;
type kCoefFilters is record
    kCoeffYcbcr    : kernelCoeff;
    kCoeffCgain    : kernelCoeff;
    kCoef1Cgain    : kernelCoeff;
    kCoeffSharp    : kernelCoeff;
    kCoeffBlure    : kernelCoeff;
    kCoeffEmbos    : kernelCoeff;
    kCoefXSobel    : kernelCoeff;
    kCoefYSobel    : kernelCoeff;
end record;
type kCoefFiltFloat is record
    kCoeffYcbcr    : kernelCoeDWord;
    kCoeffCgain    : kernelCoeDWord;
    kCoef1Cgain    : kernelCoeDWord;
    kCoeffSharp    : kernelCoeDWord;
    kCoeffBlure    : kernelCoeDWord;
    kCoeffEmbos    : kernelCoeDWord;
    kCoefXSobel    : kernelCoeDWord;
    kCoefYSobel    : kernelCoeDWord;
end record;
type rRgb is record
    pEof             : std_logic;
    pSof             : std_logic;
    valid            : std_logic;
    red              : std_logic_vector(7 downto 0);
    green            : std_logic_vector(7 downto 0);
    blue             : std_logic_vector(7 downto 0);
    cord             : coord;
end record;
type r2xData is record
    pEof             : std_logic;
    pSof             : std_logic;
    valid            : std_logic;
    data             : std_logic_vector(11 downto 0);
    dita             : std_logic_vector(24 downto 0);
    cord             : coord;
end record;
end package;