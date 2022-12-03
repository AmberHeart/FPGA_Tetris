// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sat Dec  3 14:18:16 2022
// Host        : YiranPrime running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [11:0]addra;
  wire clka;
  wire [7:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.326399 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "3328" *) 
  (* C_READ_DEPTH_B = "3328" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "3328" *) 
  (* C_WRITE_DEPTH_B = "3328" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25520)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
