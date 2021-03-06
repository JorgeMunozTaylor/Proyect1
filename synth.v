/* Generated by Yosys 0.5+ (git sha1 f13e387, gcc 5.3.1-8ubuntu2 -O2 -fstack-protector-strong -fPIC -Os) */

(* src = "PHY.v:5" *)
module PCIE_PHY(CLK0, CLK1, CLK2, D, START_END, ORDERED_SET, LOG_COM, CONTROL, DATA_OUT, CONTROL_OUT);
  (* src = "PHY.v:6" *)
  input CLK0;
  (* src = "PHY.v:7" *)
  input CLK1;
  (* src = "PHY.v:8" *)
  input CLK2;
  (* src = "PHY.v:15" *)
  input [1:0] CONTROL;
  (* src = "PHY.v:17" *)
  output [7:0] CONTROL_OUT;
  (* src = "PHY.v:10" *)
  input [7:0] D;
  (* src = "PHY.v:16" *)
  output [7:0] DATA_OUT;
  (* src = "PHY.v:13" *)
  input [7:0] LOG_COM;
  (* src = "PHY.v:12" *)
  input [7:0] ORDERED_SET;
  (* src = "PHY.v:11" *)
  input [7:0] START_END;
  (* src = "PHY.v:19" *)
  wire [7:0] cable_d_out;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_datos[0] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_datos[1] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_datos[2] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_datos[3] ;
  (* src = "PHY.v:53" *)
  wire [3:0] cable_dk;
  (* src = "PHY.v:5" *)
  wire \cable_dk_o[0] ;
  (* src = "PHY.v:5" *)
  wire \cable_dk_o[1] ;
  (* src = "PHY.v:5" *)
  wire \cable_dk_o[2] ;
  (* src = "PHY.v:5" *)
  wire \cable_dk_o[3] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_lane[0] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_lane[1] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_lane[2] ;
  (* src = "PHY.v:5" *)
  wire [7:0] \cable_lane[3] ;
  (* src = "PHY.v:20" *)
  wire cable_valid;
  (* src = "PHY.v:82" *)
  wire [7:0] o_D;
  (* src = "PHY.v:83" *)
  wire o_DK;
  (* src = "PHY.v:54" *)
  wire [3:0] temp_datos;
  (* src = "PHY.v:55" *)
  wire [3:0] temp_dk;
  (* src = "PHY.v:70" *)
  deserializador \$genblock$PHY.v:61$5217[0].phy_deserializador  (
    .DK(temp_dk[0]),
    .clk(CLK2),
    .data(temp_datos[0]),
    .out(\cable_datos[0] ),
    .out_DK(\cable_dk_o[0] )
  );
  (* src = "PHY.v:62" *)
  serializador \$genblock$PHY.v:61$5217[0].phy_serializador  (
    .DK(temp_dk[0]),
    .clk(CLK2),
    .data(\cable_lane[0] ),
    .enb(cable_dk[0]),
    .out(temp_datos[0])
  );
  (* src = "PHY.v:70" *)
  deserializador \$genblock$PHY.v:61$5218[1].phy_deserializador  (
    .DK(temp_dk[1]),
    .clk(CLK2),
    .data(temp_datos[1]),
    .out(\cable_datos[1] ),
    .out_DK(\cable_dk_o[1] )
  );
  (* src = "PHY.v:62" *)
  serializador \$genblock$PHY.v:61$5218[1].phy_serializador  (
    .DK(temp_dk[1]),
    .clk(CLK2),
    .data(\cable_lane[1] ),
    .enb(cable_dk[1]),
    .out(temp_datos[1])
  );
  (* src = "PHY.v:70" *)
  deserializador \$genblock$PHY.v:61$5219[2].phy_deserializador  (
    .DK(temp_dk[2]),
    .clk(CLK2),
    .data(temp_datos[2]),
    .out(\cable_datos[2] ),
    .out_DK(\cable_dk_o[2] )
  );
  (* src = "PHY.v:62" *)
  serializador \$genblock$PHY.v:61$5219[2].phy_serializador  (
    .DK(temp_dk[2]),
    .clk(CLK2),
    .data(\cable_lane[2] ),
    .enb(cable_dk[2]),
    .out(temp_datos[2])
  );
  (* src = "PHY.v:70" *)
  deserializador \$genblock$PHY.v:61$5220[3].phy_deserializador  (
    .DK(temp_dk[3]),
    .clk(CLK2),
    .data(temp_datos[3]),
    .out(\cable_datos[3] ),
    .out_DK(\cable_dk_o[3] )
  );
  (* src = "PHY.v:62" *)
  serializador \$genblock$PHY.v:61$5220[3].phy_serializador  (
    .DK(temp_dk[3]),
    .clk(CLK2),
    .data(\cable_lane[3] ),
    .enb(cable_dk[3]),
    .out(temp_datos[3])
  );
  (* src = "PHY.v:35" *)
  byte_strip phy_byte_strip (
    .CLK(CLK1),
    .D(cable_d_out),
    .DK(cable_valid),
    .DK_0(cable_dk[0]),
    .DK_1(cable_dk[1]),
    .DK_2(cable_dk[2]),
    .DK_3(cable_dk[3]),
    .LANE0(\cable_lane[0] ),
    .LANE1(\cable_lane[1] ),
    .LANE2(\cable_lane[2] ),
    .LANE3(\cable_lane[3] )
  );
  (* src = "PHY.v:85" *)
  byte_unstrip phy_byte_unstrip (
    .CLK(CLK1),
    .D(o_D),
    .DK(o_DK),
    .DK_0(\cable_dk_o[0] ),
    .DK_1(\cable_dk_o[1] ),
    .DK_2(\cable_dk_o[2] ),
    .DK_3(\cable_dk_o[3] ),
    .LANE0(\cable_datos[0] ),
    .LANE1(\cable_datos[1] ),
    .LANE2(\cable_datos[2] ),
    .LANE3(\cable_datos[3] )
  );
  (* src = "PHY.v:101" *)
  demux phy_demux (
    .clk(CLK0),
    .control(CONTROL_OUT),
    .data_in(o_D),
    .data_out(DATA_OUT),
    .valid_in(o_DK)
  );
  (* src = "PHY.v:22" *)
  mux phy_mux (
    .D_in(D),
    .D_out(cable_d_out),
    .clk(CLK0),
    .control(CONTROL),
    .logical_COM(LOG_COM),
    .ordered_set(ORDERED_SET),
    .start_end(START_END),
    .valid(cable_valid)
  );
endmodule

(* src = "byte_striping/byte_striping.v:5" *)
module byte_strip(CLK, D, DK, LANE0, LANE1, LANE2, LANE3, DK_0, DK_1, DK_2, DK_3);
  (* src = "byte_striping/byte_striping.v:7" *)
  input CLK;
  (* src = "byte_striping/byte_striping.v:8" *)
  input [7:0] D;
  (* src = "byte_striping/byte_striping.v:9" *)
  input DK;
  (* src = "byte_striping/byte_striping.v:15" *)
  output DK_0;
  (* src = "byte_striping/byte_striping.v:16" *)
  output DK_1;
  (* src = "byte_striping/byte_striping.v:17" *)
  output DK_2;
  (* src = "byte_striping/byte_striping.v:18" *)
  output DK_3;
  (* src = "byte_striping/byte_striping.v:11" *)
  output [7:0] LANE0;
  (* src = "byte_striping/byte_striping.v:12" *)
  output [7:0] LANE1;
  (* src = "byte_striping/byte_striping.v:13" *)
  output [7:0] LANE2;
  (* src = "byte_striping/byte_striping.v:14" *)
  output [7:0] LANE3;
  assign DK_0 = 1'bx;
  assign DK_1 = 1'bx;
  assign DK_2 = 1'bx;
  assign DK_3 = 1'bx;
  assign LANE0 = 8'bxxxxxxxx;
  assign LANE1 = 8'bxxxxxxxx;
  assign LANE2 = 8'bxxxxxxxx;
  assign LANE3 = 8'bxxxxxxxx;
endmodule

(* src = "byte_striping/byte_unstriping.v:5" *)
module byte_unstrip(CLK, LANE0, LANE1, LANE2, LANE3, DK_0, DK_1, DK_2, DK_3, D, DK);
  (* src = "byte_striping/byte_unstriping.v:7" *)
  input CLK;
  (* src = "byte_striping/byte_unstriping.v:17" *)
  output [7:0] D;
  (* src = "byte_striping/byte_unstriping.v:18" *)
  output DK;
  (* src = "byte_striping/byte_unstriping.v:12" *)
  input DK_0;
  (* src = "byte_striping/byte_unstriping.v:13" *)
  input DK_1;
  (* src = "byte_striping/byte_unstriping.v:14" *)
  input DK_2;
  (* src = "byte_striping/byte_unstriping.v:15" *)
  input DK_3;
  (* src = "byte_striping/byte_unstriping.v:8" *)
  input [7:0] LANE0;
  (* src = "byte_striping/byte_unstriping.v:9" *)
  input [7:0] LANE1;
  (* src = "byte_striping/byte_unstriping.v:10" *)
  input [7:0] LANE2;
  (* src = "byte_striping/byte_unstriping.v:11" *)
  input [7:0] LANE3;
  assign D = LANE0;
  assign DK = DK_0;
endmodule

(* src = "demux/demux.v:5" *)
module demux(valid_in, data_in, clk, data_out, control);
  (* src = "demux/demux.v:29" *)
  wire [7:0] _000_;
  (* src = "demux/demux.v:29" *)
  wire [7:0] _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  (* src = "demux/demux.v:24" *)
  wire [7:0] cable_data;
  (* src = "demux/demux.v:8" *)
  input clk;
  (* src = "demux/demux.v:10" *)
  output [7:0] control;
  (* src = "demux/demux.v:7" *)
  input [7:0] data_in;
  (* src = "demux/demux.v:9" *)
  output [7:0] data_out;
  (* src = "demux/demux.v:6" *)
  input valid_in;
  NOT _082_ (
    .A(data_in[5]),
    .Y(_018_)
  );
  NAND _083_ (
    .A(_018_),
    .B(data_in[7]),
    .Y(_019_)
  );
  NOT _084_ (
    .A(data_in[4]),
    .Y(_020_)
  );
  NOT _085_ (
    .A(data_in[7]),
    .Y(_021_)
  );
  NOT _086_ (
    .A(data_in[6]),
    .Y(_022_)
  );
  NOR _087_ (
    .A(_022_),
    .B(_021_),
    .Y(_023_)
  );
  NOR _088_ (
    .A(_023_),
    .B(_020_),
    .Y(_024_)
  );
  NAND _089_ (
    .A(_024_),
    .B(_019_),
    .Y(_025_)
  );
  NAND _090_ (
    .A(data_in[3]),
    .B(data_in[2]),
    .Y(_026_)
  );
  NOT _091_ (
    .A(data_in[0]),
    .Y(_027_)
  );
  NOT _092_ (
    .A(data_in[1]),
    .Y(_028_)
  );
  NAND _093_ (
    .A(_028_),
    .B(_027_),
    .Y(_029_)
  );
  NOR _094_ (
    .A(_029_),
    .B(_026_),
    .Y(_030_)
  );
  NAND _095_ (
    .A(data_in[4]),
    .B(data_in[5]),
    .Y(_031_)
  );
  NAND _096_ (
    .A(_031_),
    .B(data_in[6]),
    .Y(_032_)
  );
  NAND _097_ (
    .A(_032_),
    .B(_030_),
    .Y(_033_)
  );
  NOR _098_ (
    .A(_033_),
    .B(_025_),
    .Y(_034_)
  );
  NAND _099_ (
    .A(data_in[6]),
    .B(data_in[7]),
    .Y(_035_)
  );
  NOR _100_ (
    .A(_031_),
    .B(_035_),
    .Y(_036_)
  );
  NOR _101_ (
    .A(data_in[1]),
    .B(data_in[0]),
    .Y(_037_)
  );
  NOT _102_ (
    .A(data_in[2]),
    .Y(_038_)
  );
  NOT _103_ (
    .A(data_in[3]),
    .Y(_039_)
  );
  NOR _104_ (
    .A(_039_),
    .B(_038_),
    .Y(_040_)
  );
  NAND _105_ (
    .A(data_in[1]),
    .B(data_in[0]),
    .Y(_041_)
  );
  NAND _106_ (
    .A(_041_),
    .B(_040_),
    .Y(_042_)
  );
  NOR _107_ (
    .A(_042_),
    .B(_037_),
    .Y(_043_)
  );
  NAND _108_ (
    .A(_043_),
    .B(_036_),
    .Y(_044_)
  );
  NOR _109_ (
    .A(_020_),
    .B(_018_),
    .Y(_045_)
  );
  NAND _110_ (
    .A(_045_),
    .B(_023_),
    .Y(_046_)
  );
  NOR _111_ (
    .A(_028_),
    .B(_027_),
    .Y(_047_)
  );
  NOR _112_ (
    .A(_039_),
    .B(data_in[2]),
    .Y(_048_)
  );
  NAND _113_ (
    .A(_048_),
    .B(_047_),
    .Y(_049_)
  );
  NOR _114_ (
    .A(_049_),
    .B(_046_),
    .Y(_050_)
  );
  NAND _115_ (
    .A(_037_),
    .B(_040_),
    .Y(_051_)
  );
  NOR _116_ (
    .A(_020_),
    .B(data_in[5]),
    .Y(_052_)
  );
  NOR _117_ (
    .A(_022_),
    .B(data_in[7]),
    .Y(_053_)
  );
  NAND _118_ (
    .A(_053_),
    .B(_052_),
    .Y(_054_)
  );
  NOR _119_ (
    .A(_054_),
    .B(_051_),
    .Y(_055_)
  );
  NOR _120_ (
    .A(_055_),
    .B(_050_),
    .Y(_057_)
  );
  NAND _121_ (
    .A(_057_),
    .B(_044_),
    .Y(_059_)
  );
  NOR _122_ (
    .A(_059_),
    .B(_034_),
    .Y(_061_)
  );
  NOR _123_ (
    .A(_061_),
    .B(data_out[0]),
    .Y(_063_)
  );
  NAND _124_ (
    .A(data_in[3]),
    .B(_038_),
    .Y(_065_)
  );
  NOR _125_ (
    .A(_065_),
    .B(_041_),
    .Y(_067_)
  );
  NAND _126_ (
    .A(_067_),
    .B(_036_),
    .Y(_069_)
  );
  NAND _127_ (
    .A(data_in[4]),
    .B(_018_),
    .Y(_071_)
  );
  NAND _128_ (
    .A(data_in[6]),
    .B(_021_),
    .Y(_073_)
  );
  NOR _129_ (
    .A(_073_),
    .B(_071_),
    .Y(_075_)
  );
  NAND _130_ (
    .A(_075_),
    .B(_030_),
    .Y(_076_)
  );
  NAND _131_ (
    .A(_076_),
    .B(_069_),
    .Y(_078_)
  );
  NOR _132_ (
    .A(_078_),
    .B(_034_),
    .Y(_002_)
  );
  NAND _133_ (
    .A(_002_),
    .B(_044_),
    .Y(_000_[3])
  );
  NOR _134_ (
    .A(_000_[3]),
    .B(data_in[0]),
    .Y(_005_)
  );
  NOR _135_ (
    .A(_005_),
    .B(_063_),
    .Y(_001_[0])
  );
  NOR _136_ (
    .A(_061_),
    .B(data_out[1]),
    .Y(_006_)
  );
  NOR _137_ (
    .A(_000_[3]),
    .B(data_in[1]),
    .Y(_007_)
  );
  NOR _138_ (
    .A(_007_),
    .B(_006_),
    .Y(_001_[1])
  );
  NOR _139_ (
    .A(_061_),
    .B(data_out[2]),
    .Y(_008_)
  );
  NOR _140_ (
    .A(_000_[3]),
    .B(data_in[2]),
    .Y(_009_)
  );
  NOR _141_ (
    .A(_009_),
    .B(_008_),
    .Y(_001_[2])
  );
  NOR _142_ (
    .A(_061_),
    .B(data_out[3]),
    .Y(_010_)
  );
  NOR _143_ (
    .A(_010_),
    .B(_039_),
    .Y(_001_[3])
  );
  NOR _144_ (
    .A(_061_),
    .B(data_out[4]),
    .Y(_011_)
  );
  NOR _145_ (
    .A(_011_),
    .B(_020_),
    .Y(_001_[4])
  );
  NOR _146_ (
    .A(_061_),
    .B(data_out[5]),
    .Y(_012_)
  );
  NOR _147_ (
    .A(_000_[3]),
    .B(data_in[5]),
    .Y(_013_)
  );
  NOR _148_ (
    .A(_013_),
    .B(_012_),
    .Y(_001_[5])
  );
  NOR _149_ (
    .A(_061_),
    .B(data_out[6]),
    .Y(_014_)
  );
  NOR _150_ (
    .A(_000_[3]),
    .B(data_in[6]),
    .Y(_015_)
  );
  NOR _151_ (
    .A(_015_),
    .B(_014_),
    .Y(_001_[6])
  );
  NOR _152_ (
    .A(_061_),
    .B(data_out[7]),
    .Y(_016_)
  );
  NOR _153_ (
    .A(_000_[3]),
    .B(data_in[7]),
    .Y(_017_)
  );
  NOR _154_ (
    .A(_017_),
    .B(_016_),
    .Y(_001_[7])
  );
  NOR _155_ (
    .A(_061_),
    .B(_027_),
    .Y(_000_[0])
  );
  NOR _156_ (
    .A(_061_),
    .B(_028_),
    .Y(_000_[1])
  );
  NOR _157_ (
    .A(_061_),
    .B(_038_),
    .Y(_000_[2])
  );
  NOR _158_ (
    .A(_061_),
    .B(_018_),
    .Y(_000_[5])
  );
  NOR _159_ (
    .A(_061_),
    .B(_022_),
    .Y(_000_[6])
  );
  NOR _160_ (
    .A(_061_),
    .B(_021_),
    .Y(_000_[7])
  );
  NOT _161_ (
    .A(clk),
    .Y(_079_)
  );
  BUF _162_ (
    .A(_000_[3]),
    .Y(_000_[4])
  );
  BUF _163_ (
    .A(_079_),
    .Y(_056_)
  );
  BUF _164_ (
    .A(_079_),
    .Y(_058_)
  );
  BUF _165_ (
    .A(_079_),
    .Y(_060_)
  );
  BUF _166_ (
    .A(_079_),
    .Y(_062_)
  );
  BUF _167_ (
    .A(_079_),
    .Y(_064_)
  );
  BUF _168_ (
    .A(_079_),
    .Y(_066_)
  );
  BUF _169_ (
    .A(_079_),
    .Y(_068_)
  );
  BUF _170_ (
    .A(_079_),
    .Y(_070_)
  );
  BUF _171_ (
    .A(_079_),
    .Y(_072_)
  );
  BUF _172_ (
    .A(_079_),
    .Y(_074_)
  );
  BUF _173_ (
    .A(_079_),
    .Y(_080_)
  );
  BUF _174_ (
    .A(_079_),
    .Y(_077_)
  );
  BUF _175_ (
    .A(_079_),
    .Y(_081_)
  );
  BUF _176_ (
    .A(_079_),
    .Y(_003_)
  );
  BUF _177_ (
    .A(_079_),
    .Y(_004_)
  );
  DFF _178_ (
    .C(_079_),
    .D(_001_[0]),
    .Q(data_out[0])
  );
  DFF _179_ (
    .C(_056_),
    .D(_001_[1]),
    .Q(data_out[1])
  );
  DFF _180_ (
    .C(_058_),
    .D(_001_[2]),
    .Q(data_out[2])
  );
  DFF _181_ (
    .C(_060_),
    .D(_001_[3]),
    .Q(data_out[3])
  );
  DFF _182_ (
    .C(_062_),
    .D(_001_[4]),
    .Q(data_out[4])
  );
  DFF _183_ (
    .C(_064_),
    .D(_001_[5]),
    .Q(data_out[5])
  );
  DFF _184_ (
    .C(_066_),
    .D(_001_[6]),
    .Q(data_out[6])
  );
  DFF _185_ (
    .C(_068_),
    .D(_001_[7]),
    .Q(data_out[7])
  );
  DFF _186_ (
    .C(_070_),
    .D(_000_[0]),
    .Q(control[0])
  );
  DFF _187_ (
    .C(_072_),
    .D(_000_[1]),
    .Q(control[1])
  );
  DFF _188_ (
    .C(_074_),
    .D(_000_[2]),
    .Q(control[2])
  );
  DFF _189_ (
    .C(_080_),
    .D(_000_[3]),
    .Q(control[3])
  );
  DFF _190_ (
    .C(_077_),
    .D(_000_[4]),
    .Q(control[4])
  );
  DFF _191_ (
    .C(_081_),
    .D(_000_[5]),
    .Q(control[5])
  );
  DFF _192_ (
    .C(_003_),
    .D(_000_[6]),
    .Q(control[6])
  );
  DFF _193_ (
    .C(_004_),
    .D(_000_[7]),
    .Q(control[7])
  );
  DFF _194_ (
    .C(clk),
    .D(_001_[0]),
    .Q(data_out[0])
  );
  DFF _195_ (
    .C(clk),
    .D(_001_[1]),
    .Q(data_out[1])
  );
  DFF _196_ (
    .C(clk),
    .D(_001_[2]),
    .Q(data_out[2])
  );
  DFF _197_ (
    .C(clk),
    .D(_001_[3]),
    .Q(data_out[3])
  );
  DFF _198_ (
    .C(clk),
    .D(_001_[4]),
    .Q(data_out[4])
  );
  DFF _199_ (
    .C(clk),
    .D(_001_[5]),
    .Q(data_out[5])
  );
  DFF _200_ (
    .C(clk),
    .D(_001_[6]),
    .Q(data_out[6])
  );
  DFF _201_ (
    .C(clk),
    .D(_001_[7]),
    .Q(data_out[7])
  );
  DFF _202_ (
    .C(clk),
    .D(_000_[0]),
    .Q(control[0])
  );
  DFF _203_ (
    .C(clk),
    .D(_000_[1]),
    .Q(control[1])
  );
  DFF _204_ (
    .C(clk),
    .D(_000_[2]),
    .Q(control[2])
  );
  DFF _205_ (
    .C(clk),
    .D(_000_[3]),
    .Q(control[3])
  );
  DFF _206_ (
    .C(clk),
    .D(_000_[4]),
    .Q(control[4])
  );
  DFF _207_ (
    .C(clk),
    .D(_000_[5]),
    .Q(control[5])
  );
  DFF _208_ (
    .C(clk),
    .D(_000_[6]),
    .Q(control[6])
  );
  DFF _209_ (
    .C(clk),
    .D(_000_[7]),
    .Q(control[7])
  );
  assign cable_data = data_in;
endmodule

(* src = "serdes/Deserializador.v:5" *)
module deserializador(clk, data, DK, out_DK, out);
  (* src = "serdes/Deserializador.v:35" *)
  wire [3:0] _000_;
  (* src = "serdes/Deserializador.v:35" *)
  wire _001_;
  (* src = "serdes/Deserializador.v:58" *)
  wire [7:0] _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  (* src = "serdes/Deserializador.v:71" *)
  wire _072_;
  (* src = "serdes/Deserializador.v:10" *)
  input DK;
  (* init = 4'b0111 *)
  (* src = "serdes/Deserializador.v:28" *)
  wire [3:0] cable_counter;
  (* src = "serdes/Deserializador.v:8" *)
  input clk;
  (* init = 1'b0 *)
  (* src = "serdes/Deserializador.v:29" *)
  wire count;
  (* init = 4'b0111 *)
  (* src = "serdes/Deserializador.v:27" *)
  wire [3:0] counter;
  (* src = "serdes/Deserializador.v:9" *)
  input data;
  (* src = "serdes/Deserializador.v:13" *)
  output [7:0] out;
  (* src = "serdes/Deserializador.v:12" *)
  output out_DK;
  (* src = "serdes/Deserializador.v:30" *)
  wire [7:0] temp;
  NOT _073_ (
    .A(count),
    .Y(_001_)
  );
  NOT _074_ (
    .A(cable_counter[0]),
    .Y(_000_[0])
  );
  NOT _075_ (
    .A(cable_counter[1]),
    .Y(_011_)
  );
  NAND _076_ (
    .A(_011_),
    .B(_000_[0]),
    .Y(_012_)
  );
  NOT _077_ (
    .A(cable_counter[3]),
    .Y(_013_)
  );
  NOT _078_ (
    .A(cable_counter[2]),
    .Y(_014_)
  );
  NAND _079_ (
    .A(_014_),
    .B(_013_),
    .Y(_015_)
  );
  NOR _080_ (
    .A(_015_),
    .B(_012_),
    .Y(_072_)
  );
  NAND _081_ (
    .A(cable_counter[2]),
    .B(_013_),
    .Y(_016_)
  );
  NAND _082_ (
    .A(_011_),
    .B(cable_counter[0]),
    .Y(_017_)
  );
  NOR _083_ (
    .A(_017_),
    .B(_016_),
    .Y(_018_)
  );
  NAND _084_ (
    .A(_018_),
    .B(data),
    .Y(_019_)
  );
  NOR _085_ (
    .A(_014_),
    .B(cable_counter[3]),
    .Y(_020_)
  );
  NOR _086_ (
    .A(cable_counter[1]),
    .B(_000_[0]),
    .Y(_021_)
  );
  NAND _087_ (
    .A(_021_),
    .B(_020_),
    .Y(_022_)
  );
  NAND _088_ (
    .A(_022_),
    .B(temp[2]),
    .Y(_023_)
  );
  NAND _089_ (
    .A(_023_),
    .B(_019_),
    .Y(_002_[2])
  );
  NAND _090_ (
    .A(cable_counter[1]),
    .B(_000_[0]),
    .Y(_024_)
  );
  NOR _091_ (
    .A(_024_),
    .B(_016_),
    .Y(_025_)
  );
  NAND _092_ (
    .A(_025_),
    .B(data),
    .Y(_026_)
  );
  NOR _093_ (
    .A(_011_),
    .B(cable_counter[0]),
    .Y(_027_)
  );
  NAND _094_ (
    .A(_027_),
    .B(_020_),
    .Y(_028_)
  );
  NAND _095_ (
    .A(_028_),
    .B(temp[1]),
    .Y(_029_)
  );
  NAND _096_ (
    .A(_029_),
    .B(_026_),
    .Y(_002_[1])
  );
  NAND _097_ (
    .A(cable_counter[1]),
    .B(cable_counter[0]),
    .Y(_030_)
  );
  NOR _098_ (
    .A(_030_),
    .B(_016_),
    .Y(_031_)
  );
  NAND _099_ (
    .A(_031_),
    .B(data),
    .Y(_032_)
  );
  NOR _100_ (
    .A(_011_),
    .B(_000_[0]),
    .Y(_033_)
  );
  NAND _101_ (
    .A(_033_),
    .B(_020_),
    .Y(_034_)
  );
  NAND _102_ (
    .A(_034_),
    .B(temp[0]),
    .Y(_035_)
  );
  NAND _103_ (
    .A(_035_),
    .B(_032_),
    .Y(_002_[0])
  );
  NOR _104_ (
    .A(_072_),
    .B(temp[7]),
    .Y(_036_)
  );
  NOR _105_ (
    .A(cable_counter[1]),
    .B(cable_counter[0]),
    .Y(_037_)
  );
  NOR _106_ (
    .A(cable_counter[2]),
    .B(cable_counter[3]),
    .Y(_038_)
  );
  NAND _107_ (
    .A(_038_),
    .B(_037_),
    .Y(_039_)
  );
  NOR _108_ (
    .A(_039_),
    .B(data),
    .Y(_040_)
  );
  NOR _109_ (
    .A(_040_),
    .B(_036_),
    .Y(_002_[7])
  );
  NOR _110_ (
    .A(_024_),
    .B(_015_),
    .Y(_041_)
  );
  NAND _111_ (
    .A(_041_),
    .B(data),
    .Y(_042_)
  );
  NAND _112_ (
    .A(_027_),
    .B(_038_),
    .Y(_043_)
  );
  NAND _113_ (
    .A(_043_),
    .B(temp[5]),
    .Y(_045_)
  );
  NAND _114_ (
    .A(_045_),
    .B(_042_),
    .Y(_002_[5])
  );
  NOR _115_ (
    .A(_016_),
    .B(_012_),
    .Y(_046_)
  );
  NAND _116_ (
    .A(_046_),
    .B(data),
    .Y(_047_)
  );
  NAND _117_ (
    .A(_020_),
    .B(_037_),
    .Y(_048_)
  );
  NAND _118_ (
    .A(_048_),
    .B(temp[3]),
    .Y(_049_)
  );
  NAND _119_ (
    .A(_049_),
    .B(_047_),
    .Y(_002_[3])
  );
  NOR _120_ (
    .A(_017_),
    .B(_015_),
    .Y(_050_)
  );
  NAND _121_ (
    .A(_050_),
    .B(data),
    .Y(_051_)
  );
  NAND _122_ (
    .A(_021_),
    .B(_038_),
    .Y(_003_)
  );
  NAND _123_ (
    .A(_003_),
    .B(temp[6]),
    .Y(_004_)
  );
  NAND _124_ (
    .A(_004_),
    .B(_051_),
    .Y(_002_[6])
  );
  NOR _125_ (
    .A(_030_),
    .B(_015_),
    .Y(_005_)
  );
  NAND _126_ (
    .A(_005_),
    .B(data),
    .Y(_006_)
  );
  NAND _127_ (
    .A(_033_),
    .B(_038_),
    .Y(_007_)
  );
  NAND _128_ (
    .A(_007_),
    .B(temp[4]),
    .Y(_008_)
  );
  NAND _129_ (
    .A(_008_),
    .B(_006_),
    .Y(_002_[4])
  );
  NAND _130_ (
    .A(_024_),
    .B(_017_),
    .Y(_000_[1])
  );
  NOR _131_ (
    .A(_030_),
    .B(_014_),
    .Y(_009_)
  );
  NOR _132_ (
    .A(_033_),
    .B(cable_counter[2]),
    .Y(_010_)
  );
  NOR _133_ (
    .A(_010_),
    .B(_009_),
    .Y(_000_[2])
  );
  NOR _134_ (
    .A(_009_),
    .B(_013_),
    .Y(_000_[3])
  );
  NOT _135_ (
    .A(data),
    .Y(_059_)
  );
  NOT _136_ (
    .A(clk),
    .Y(_067_)
  );
  BUF _137_ (
    .A(_001_),
    .Y(_044_)
  );
  BUF _138_ (
    .A(_001_),
    .Y(_052_)
  );
  BUF _139_ (
    .A(_001_),
    .Y(_053_)
  );
  BUF _140_ (
    .A(_001_),
    .Y(_054_)
  );
  BUF _141_ (
    .A(_001_),
    .Y(_055_)
  );
  BUF _142_ (
    .A(_001_),
    .Y(_056_)
  );
  BUF _143_ (
    .A(_001_),
    .Y(_057_)
  );
  BUF _144_ (
    .A(_001_),
    .Y(_058_)
  );
  BUF _145_ (
    .A(_059_),
    .Y(_060_)
  );
  BUF _146_ (
    .A(_059_),
    .Y(_061_)
  );
  BUF _147_ (
    .A(_059_),
    .Y(_062_)
  );
  BUF _148_ (
    .A(_059_),
    .Y(_063_)
  );
  BUF _149_ (
    .A(_059_),
    .Y(_064_)
  );
  BUF _150_ (
    .A(_059_),
    .Y(_065_)
  );
  BUF _151_ (
    .A(_059_),
    .Y(_066_)
  );
  BUF _152_ (
    .A(_067_),
    .Y(_068_)
  );
  BUF _153_ (
    .A(_067_),
    .Y(_069_)
  );
  BUF _154_ (
    .A(_067_),
    .Y(_070_)
  );
  BUF _155_ (
    .A(_067_),
    .Y(_071_)
  );
  DFF _156_ (
    .C(_072_),
    .D(DK),
    .Q(out_DK)
  );
  DFF _157_ (
    .C(_072_),
    .D(temp[0]),
    .Q(out[0])
  );
  DFF _158_ (
    .C(_072_),
    .D(temp[1]),
    .Q(out[1])
  );
  DFF _159_ (
    .C(_072_),
    .D(temp[2]),
    .Q(out[2])
  );
  DFF _160_ (
    .C(_072_),
    .D(temp[3]),
    .Q(out[3])
  );
  DFF _161_ (
    .C(_072_),
    .D(temp[4]),
    .Q(out[4])
  );
  DFF _162_ (
    .C(_072_),
    .D(temp[5]),
    .Q(out[5])
  );
  DFF _163_ (
    .C(_072_),
    .D(temp[6]),
    .Q(out[6])
  );
  DFF _164_ (
    .C(_072_),
    .D(temp[7]),
    .Q(out[7])
  );
  DFF _165_ (
    .C(_044_),
    .D(_002_[0]),
    .Q(temp[0])
  );
  DFF _166_ (
    .C(_052_),
    .D(_002_[1]),
    .Q(temp[1])
  );
  DFF _167_ (
    .C(_053_),
    .D(_002_[2]),
    .Q(temp[2])
  );
  DFF _168_ (
    .C(_054_),
    .D(_002_[3]),
    .Q(temp[3])
  );
  DFF _169_ (
    .C(_055_),
    .D(_002_[4]),
    .Q(temp[4])
  );
  DFF _170_ (
    .C(_056_),
    .D(_002_[5]),
    .Q(temp[5])
  );
  DFF _171_ (
    .C(_057_),
    .D(_002_[6]),
    .Q(temp[6])
  );
  DFF _172_ (
    .C(_058_),
    .D(_002_[7]),
    .Q(temp[7])
  );
  DFF _173_ (
    .C(count),
    .D(_002_[0]),
    .Q(temp[0])
  );
  DFF _174_ (
    .C(count),
    .D(_002_[1]),
    .Q(temp[1])
  );
  DFF _175_ (
    .C(count),
    .D(_002_[2]),
    .Q(temp[2])
  );
  DFF _176_ (
    .C(count),
    .D(_002_[3]),
    .Q(temp[3])
  );
  DFF _177_ (
    .C(count),
    .D(_002_[4]),
    .Q(temp[4])
  );
  DFF _178_ (
    .C(count),
    .D(_002_[5]),
    .Q(temp[5])
  );
  DFF _179_ (
    .C(count),
    .D(_002_[6]),
    .Q(temp[6])
  );
  DFF _180_ (
    .C(count),
    .D(_002_[7]),
    .Q(temp[7])
  );
  DFF _181_ (
    .C(_059_),
    .D(_002_[0]),
    .Q(temp[0])
  );
  DFF _182_ (
    .C(_060_),
    .D(_002_[1]),
    .Q(temp[1])
  );
  DFF _183_ (
    .C(_061_),
    .D(_002_[2]),
    .Q(temp[2])
  );
  DFF _184_ (
    .C(_062_),
    .D(_002_[3]),
    .Q(temp[3])
  );
  DFF _185_ (
    .C(_063_),
    .D(_002_[4]),
    .Q(temp[4])
  );
  DFF _186_ (
    .C(_064_),
    .D(_002_[5]),
    .Q(temp[5])
  );
  DFF _187_ (
    .C(_065_),
    .D(_002_[6]),
    .Q(temp[6])
  );
  DFF _188_ (
    .C(_066_),
    .D(_002_[7]),
    .Q(temp[7])
  );
  DFF _189_ (
    .C(data),
    .D(_002_[0]),
    .Q(temp[0])
  );
  DFF _190_ (
    .C(data),
    .D(_002_[1]),
    .Q(temp[1])
  );
  DFF _191_ (
    .C(data),
    .D(_002_[2]),
    .Q(temp[2])
  );
  DFF _192_ (
    .C(data),
    .D(_002_[3]),
    .Q(temp[3])
  );
  DFF _193_ (
    .C(data),
    .D(_002_[4]),
    .Q(temp[4])
  );
  DFF _194_ (
    .C(data),
    .D(_002_[5]),
    .Q(temp[5])
  );
  DFF _195_ (
    .C(data),
    .D(_002_[6]),
    .Q(temp[6])
  );
  DFF _196_ (
    .C(data),
    .D(_002_[7]),
    .Q(temp[7])
  );
  DFF _197_ (
    .C(_067_),
    .D(_001_),
    .Q(count)
  );
  DFF _198_ (
    .C(_068_),
    .D(_000_[0]),
    .Q(cable_counter[0])
  );
  DFF _199_ (
    .C(_069_),
    .D(_000_[1]),
    .Q(cable_counter[1])
  );
  DFF _200_ (
    .C(_070_),
    .D(_000_[2]),
    .Q(cable_counter[2])
  );
  DFF _201_ (
    .C(_071_),
    .D(_000_[3]),
    .Q(cable_counter[3])
  );
  DFF _202_ (
    .C(clk),
    .D(_001_),
    .Q(count)
  );
  DFF _203_ (
    .C(clk),
    .D(_000_[0]),
    .Q(cable_counter[0])
  );
  DFF _204_ (
    .C(clk),
    .D(_000_[1]),
    .Q(cable_counter[1])
  );
  DFF _205_ (
    .C(clk),
    .D(_000_[2]),
    .Q(cable_counter[2])
  );
  DFF _206_ (
    .C(clk),
    .D(_000_[3]),
    .Q(cable_counter[3])
  );
  assign counter = cable_counter;
endmodule

(* src = "mux/mux.v:5" *)
module mux(clk, control, D_in, start_end, ordered_set, logical_COM, D_out, valid);
  (* src = "mux/mux.v:19" *)
  wire [7:0] _000_;
  (* src = "mux/mux.v:19" *)
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  (* src = "mux/mux.v:9" *)
  input [7:0] D_in;
  (* src = "mux/mux.v:14" *)
  output [7:0] D_out;
  (* src = "mux/mux.v:6" *)
  input clk;
  (* src = "mux/mux.v:7" *)
  input [1:0] control;
  (* src = "mux/mux.v:12" *)
  input [7:0] logical_COM;
  (* src = "mux/mux.v:11" *)
  input [7:0] ordered_set;
  (* src = "mux/mux.v:10" *)
  input [7:0] start_end;
  (* src = "mux/mux.v:15" *)
  output valid;
  NOR _078_ (
    .A(control[1]),
    .B(control[0]),
    .Y(_001_)
  );
  NAND _079_ (
    .A(_001_),
    .B(D_in[0]),
    .Y(_036_)
  );
  NOT _080_ (
    .A(control[1]),
    .Y(_037_)
  );
  NOR _081_ (
    .A(_037_),
    .B(control[0]),
    .Y(_038_)
  );
  NAND _082_ (
    .A(_038_),
    .B(ordered_set[0]),
    .Y(_039_)
  );
  NOT _083_ (
    .A(control[0]),
    .Y(_040_)
  );
  NOR _084_ (
    .A(_037_),
    .B(_040_),
    .Y(_041_)
  );
  NAND _085_ (
    .A(_041_),
    .B(logical_COM[0]),
    .Y(_042_)
  );
  NAND _086_ (
    .A(_042_),
    .B(_039_),
    .Y(_043_)
  );
  NOT _087_ (
    .A(start_end[0]),
    .Y(_044_)
  );
  NOR _088_ (
    .A(control[1]),
    .B(_040_),
    .Y(_045_)
  );
  NOT _089_ (
    .A(_045_),
    .Y(_046_)
  );
  NOR _090_ (
    .A(_046_),
    .B(_044_),
    .Y(_047_)
  );
  NOR _091_ (
    .A(_047_),
    .B(_043_),
    .Y(_048_)
  );
  NAND _092_ (
    .A(_048_),
    .B(_036_),
    .Y(_000_[0])
  );
  NAND _093_ (
    .A(_001_),
    .B(D_in[1]),
    .Y(_049_)
  );
  NAND _094_ (
    .A(_038_),
    .B(ordered_set[1]),
    .Y(_050_)
  );
  NAND _095_ (
    .A(D_out[1]),
    .B(_037_),
    .Y(_051_)
  );
  NAND _096_ (
    .A(_051_),
    .B(_040_),
    .Y(_052_)
  );
  NOT _097_ (
    .A(logical_COM[1]),
    .Y(_053_)
  );
  NAND _098_ (
    .A(_053_),
    .B(control[1]),
    .Y(_054_)
  );
  NAND _099_ (
    .A(_054_),
    .B(_052_),
    .Y(_055_)
  );
  NAND _100_ (
    .A(_055_),
    .B(_050_),
    .Y(_056_)
  );
  NOR _101_ (
    .A(start_end[1]),
    .B(control[1]),
    .Y(_057_)
  );
  NOR _102_ (
    .A(_057_),
    .B(_001_),
    .Y(_058_)
  );
  NAND _103_ (
    .A(_058_),
    .B(_056_),
    .Y(_060_)
  );
  NAND _104_ (
    .A(_060_),
    .B(_049_),
    .Y(_000_[1])
  );
  NAND _105_ (
    .A(_001_),
    .B(D_in[2]),
    .Y(_063_)
  );
  NOT _106_ (
    .A(start_end[2]),
    .Y(_065_)
  );
  NOR _107_ (
    .A(_046_),
    .B(_065_),
    .Y(_067_)
  );
  NAND _108_ (
    .A(_038_),
    .B(ordered_set[2]),
    .Y(_069_)
  );
  NAND _109_ (
    .A(_041_),
    .B(logical_COM[2]),
    .Y(_071_)
  );
  NAND _110_ (
    .A(_071_),
    .B(_069_),
    .Y(_073_)
  );
  NOR _111_ (
    .A(_073_),
    .B(_067_),
    .Y(_075_)
  );
  NAND _112_ (
    .A(_075_),
    .B(_063_),
    .Y(_000_[2])
  );
  NAND _113_ (
    .A(_045_),
    .B(start_end[3]),
    .Y(_076_)
  );
  NOT _114_ (
    .A(D_in[3]),
    .Y(_077_)
  );
  NOT _115_ (
    .A(_001_),
    .Y(_002_)
  );
  NOR _116_ (
    .A(_002_),
    .B(_077_),
    .Y(_003_)
  );
  NAND _117_ (
    .A(_038_),
    .B(ordered_set[3]),
    .Y(_004_)
  );
  NAND _118_ (
    .A(_041_),
    .B(logical_COM[3]),
    .Y(_005_)
  );
  NAND _119_ (
    .A(_005_),
    .B(_004_),
    .Y(_006_)
  );
  NOR _120_ (
    .A(_006_),
    .B(_003_),
    .Y(_007_)
  );
  NAND _121_ (
    .A(_007_),
    .B(_076_),
    .Y(_000_[3])
  );
  NAND _122_ (
    .A(_045_),
    .B(start_end[4]),
    .Y(_008_)
  );
  NOT _123_ (
    .A(D_in[4]),
    .Y(_009_)
  );
  NOR _124_ (
    .A(_002_),
    .B(_009_),
    .Y(_010_)
  );
  NAND _125_ (
    .A(_038_),
    .B(ordered_set[4]),
    .Y(_011_)
  );
  NAND _126_ (
    .A(_041_),
    .B(logical_COM[4]),
    .Y(_012_)
  );
  NAND _127_ (
    .A(_012_),
    .B(_011_),
    .Y(_013_)
  );
  NOR _128_ (
    .A(_013_),
    .B(_010_),
    .Y(_014_)
  );
  NAND _129_ (
    .A(_014_),
    .B(_008_),
    .Y(_000_[4])
  );
  NAND _130_ (
    .A(_045_),
    .B(start_end[5]),
    .Y(_015_)
  );
  NOT _131_ (
    .A(D_in[5]),
    .Y(_016_)
  );
  NOR _132_ (
    .A(_002_),
    .B(_016_),
    .Y(_017_)
  );
  NAND _133_ (
    .A(_038_),
    .B(ordered_set[5]),
    .Y(_018_)
  );
  NAND _134_ (
    .A(_041_),
    .B(logical_COM[5]),
    .Y(_019_)
  );
  NAND _135_ (
    .A(_019_),
    .B(_018_),
    .Y(_020_)
  );
  NOR _136_ (
    .A(_020_),
    .B(_017_),
    .Y(_021_)
  );
  NAND _137_ (
    .A(_021_),
    .B(_015_),
    .Y(_000_[5])
  );
  NAND _138_ (
    .A(_045_),
    .B(start_end[6]),
    .Y(_022_)
  );
  NOT _139_ (
    .A(D_in[6]),
    .Y(_023_)
  );
  NOR _140_ (
    .A(_002_),
    .B(_023_),
    .Y(_024_)
  );
  NAND _141_ (
    .A(_038_),
    .B(ordered_set[6]),
    .Y(_025_)
  );
  NAND _142_ (
    .A(_041_),
    .B(logical_COM[6]),
    .Y(_026_)
  );
  NAND _143_ (
    .A(_026_),
    .B(_025_),
    .Y(_027_)
  );
  NOR _144_ (
    .A(_027_),
    .B(_024_),
    .Y(_028_)
  );
  NAND _145_ (
    .A(_028_),
    .B(_022_),
    .Y(_000_[6])
  );
  NAND _146_ (
    .A(_045_),
    .B(start_end[7]),
    .Y(_029_)
  );
  NOT _147_ (
    .A(D_in[7]),
    .Y(_030_)
  );
  NOR _148_ (
    .A(_002_),
    .B(_030_),
    .Y(_031_)
  );
  NAND _149_ (
    .A(_038_),
    .B(ordered_set[7]),
    .Y(_032_)
  );
  NAND _150_ (
    .A(_041_),
    .B(logical_COM[7]),
    .Y(_033_)
  );
  NAND _151_ (
    .A(_033_),
    .B(_032_),
    .Y(_034_)
  );
  NOR _152_ (
    .A(_034_),
    .B(_031_),
    .Y(_035_)
  );
  NAND _153_ (
    .A(_035_),
    .B(_029_),
    .Y(_000_[7])
  );
  NOT _154_ (
    .A(clk),
    .Y(_059_)
  );
  BUF _155_ (
    .A(_059_),
    .Y(_061_)
  );
  BUF _156_ (
    .A(_059_),
    .Y(_062_)
  );
  BUF _157_ (
    .A(_059_),
    .Y(_064_)
  );
  BUF _158_ (
    .A(_059_),
    .Y(_066_)
  );
  BUF _159_ (
    .A(_059_),
    .Y(_068_)
  );
  BUF _160_ (
    .A(_059_),
    .Y(_070_)
  );
  BUF _161_ (
    .A(_059_),
    .Y(_072_)
  );
  BUF _162_ (
    .A(_059_),
    .Y(_074_)
  );
  DFF _163_ (
    .C(_059_),
    .D(_000_[0]),
    .Q(D_out[0])
  );
  DFF _164_ (
    .C(_061_),
    .D(_000_[1]),
    .Q(D_out[1])
  );
  DFF _165_ (
    .C(_062_),
    .D(_000_[2]),
    .Q(D_out[2])
  );
  DFF _166_ (
    .C(_064_),
    .D(_000_[3]),
    .Q(D_out[3])
  );
  DFF _167_ (
    .C(_066_),
    .D(_000_[4]),
    .Q(D_out[4])
  );
  DFF _168_ (
    .C(_068_),
    .D(_000_[5]),
    .Q(D_out[5])
  );
  DFF _169_ (
    .C(_070_),
    .D(_000_[6]),
    .Q(D_out[6])
  );
  DFF _170_ (
    .C(_072_),
    .D(_000_[7]),
    .Q(D_out[7])
  );
  DFF _171_ (
    .C(_074_),
    .D(_001_),
    .Q(valid)
  );
  DFF _172_ (
    .C(clk),
    .D(_000_[0]),
    .Q(D_out[0])
  );
  DFF _173_ (
    .C(clk),
    .D(_000_[1]),
    .Q(D_out[1])
  );
  DFF _174_ (
    .C(clk),
    .D(_000_[2]),
    .Q(D_out[2])
  );
  DFF _175_ (
    .C(clk),
    .D(_000_[3]),
    .Q(D_out[3])
  );
  DFF _176_ (
    .C(clk),
    .D(_000_[4]),
    .Q(D_out[4])
  );
  DFF _177_ (
    .C(clk),
    .D(_000_[5]),
    .Q(D_out[5])
  );
  DFF _178_ (
    .C(clk),
    .D(_000_[6]),
    .Q(D_out[6])
  );
  DFF _179_ (
    .C(clk),
    .D(_000_[7]),
    .Q(D_out[7])
  );
  DFF _180_ (
    .C(clk),
    .D(_001_),
    .Q(valid)
  );
endmodule

(* src = "serdes/SerializadorUv.v:7" *)
module serializador(enb, data, clk, DK, out);
  (* src = "serdes/SerializadorUv.v:28" *)
  wire [3:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  wire _36_;
  wire _37_;
  (* src = "serdes/SerializadorUv.v:14" *)
  output DK;
  (* init = 4'b0111 *)
  (* src = "serdes/SerializadorUv.v:18" *)
  wire [3:0] cable_counter;
  (* src = "serdes/SerializadorUv.v:10" *)
  input clk;
  (* init = 4'b0111 *)
  (* src = "serdes/SerializadorUv.v:17" *)
  wire [3:0] counter;
  (* src = "serdes/SerializadorUv.v:11" *)
  input [7:0] data;
  (* src = "serdes/SerializadorUv.v:10" *)
  input enb;
  (* src = "serdes/SerializadorUv.v:13" *)
  output out;
  NOT _38_ (
    .A(cable_counter[0]),
    .Y(_00_[0])
  );
  NAND _39_ (
    .A(cable_counter[1]),
    .B(cable_counter[0]),
    .Y(_01_)
  );
  NOT _40_ (
    .A(_01_),
    .Y(_02_)
  );
  NOR _41_ (
    .A(cable_counter[1]),
    .B(cable_counter[0]),
    .Y(_03_)
  );
  NOR _42_ (
    .A(_03_),
    .B(_02_),
    .Y(_00_[1])
  );
  NOT _43_ (
    .A(cable_counter[2]),
    .Y(_04_)
  );
  NOR _44_ (
    .A(_01_),
    .B(_04_),
    .Y(_05_)
  );
  NOR _45_ (
    .A(_02_),
    .B(cable_counter[2]),
    .Y(_06_)
  );
  NOR _46_ (
    .A(_06_),
    .B(_05_),
    .Y(_00_[2])
  );
  NOT _47_ (
    .A(cable_counter[3]),
    .Y(_07_)
  );
  NOR _48_ (
    .A(_05_),
    .B(_07_),
    .Y(_00_[3])
  );
  NOT _49_ (
    .A(data[7]),
    .Y(_08_)
  );
  NAND _50_ (
    .A(_04_),
    .B(_08_),
    .Y(_09_)
  );
  NOR _51_ (
    .A(_04_),
    .B(data[3]),
    .Y(_10_)
  );
  NOR _52_ (
    .A(_10_),
    .B(cable_counter[1]),
    .Y(_11_)
  );
  NAND _53_ (
    .A(_11_),
    .B(_09_),
    .Y(_12_)
  );
  NOT _54_ (
    .A(data[1]),
    .Y(_13_)
  );
  NAND _55_ (
    .A(cable_counter[2]),
    .B(_13_),
    .Y(_14_)
  );
  NOT _56_ (
    .A(cable_counter[1]),
    .Y(_15_)
  );
  NOR _57_ (
    .A(cable_counter[2]),
    .B(data[5]),
    .Y(_16_)
  );
  NOR _58_ (
    .A(_16_),
    .B(_15_),
    .Y(_17_)
  );
  NAND _59_ (
    .A(_17_),
    .B(_14_),
    .Y(_18_)
  );
  NAND _60_ (
    .A(_18_),
    .B(_12_),
    .Y(_19_)
  );
  NOR _61_ (
    .A(_19_),
    .B(cable_counter[0]),
    .Y(_20_)
  );
  NOR _62_ (
    .A(cable_counter[2]),
    .B(data[6]),
    .Y(_21_)
  );
  NOT _63_ (
    .A(data[2]),
    .Y(_22_)
  );
  NAND _64_ (
    .A(cable_counter[2]),
    .B(_22_),
    .Y(_23_)
  );
  NAND _65_ (
    .A(_23_),
    .B(_15_),
    .Y(_24_)
  );
  NOR _66_ (
    .A(_24_),
    .B(_21_),
    .Y(_25_)
  );
  NOR _67_ (
    .A(_04_),
    .B(data[0]),
    .Y(_26_)
  );
  NOT _68_ (
    .A(data[4]),
    .Y(_27_)
  );
  NAND _69_ (
    .A(_04_),
    .B(_27_),
    .Y(_28_)
  );
  NAND _70_ (
    .A(_28_),
    .B(cable_counter[1]),
    .Y(_29_)
  );
  NOR _71_ (
    .A(_29_),
    .B(_26_),
    .Y(_30_)
  );
  NOR _72_ (
    .A(_30_),
    .B(_25_),
    .Y(_31_)
  );
  NAND _73_ (
    .A(_31_),
    .B(cable_counter[0]),
    .Y(_32_)
  );
  NAND _74_ (
    .A(_32_),
    .B(_07_),
    .Y(_33_)
  );
  NOR _75_ (
    .A(_33_),
    .B(_20_),
    .Y(out)
  );
  NOT _76_ (
    .A(clk),
    .Y(_34_)
  );
  BUF _77_ (
    .A(_34_),
    .Y(_35_)
  );
  BUF _78_ (
    .A(_34_),
    .Y(_36_)
  );
  BUF _79_ (
    .A(_34_),
    .Y(_37_)
  );
  DFF _80_ (
    .C(_34_),
    .D(_00_[0]),
    .Q(cable_counter[0])
  );
  DFF _81_ (
    .C(_35_),
    .D(_00_[1]),
    .Q(cable_counter[1])
  );
  DFF _82_ (
    .C(_36_),
    .D(_00_[2]),
    .Q(cable_counter[2])
  );
  DFF _83_ (
    .C(_37_),
    .D(_00_[3]),
    .Q(cable_counter[3])
  );
  DFF _84_ (
    .C(clk),
    .D(_00_[0]),
    .Q(cable_counter[0])
  );
  DFF _85_ (
    .C(clk),
    .D(_00_[1]),
    .Q(cable_counter[1])
  );
  DFF _86_ (
    .C(clk),
    .D(_00_[2]),
    .Q(cable_counter[2])
  );
  DFF _87_ (
    .C(clk),
    .D(_00_[3]),
    .Q(cable_counter[3])
  );
  assign DK = enb;
  assign counter = cable_counter;
endmodule
