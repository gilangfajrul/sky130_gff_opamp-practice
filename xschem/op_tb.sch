v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 5 -222.5 -542.5 -217.5 -537.5 {name=XXX
dir=inout}
N 35 -320 35 -305 {
lab=GND}
N 35 -395 35 -380 {
lab=VDD}
N 30 -275 30 -260 {
lab=vin}
N 30 -70 30 -55 {
lab=GND}
N 30 -200 30 -185 {
lab=GND}
N 30 -145 30 -130 {
lab=vip}
N 480 -240 500 -240 {lab=GND}
N 480 -260 500 -260 {lab=VDD}
C {devices/vsource.sym} 35 -350 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/vdd.sym} 35 -395 0 0 {name=l3 lab=VDD}
C {devices/gnd.sym} 35 -305 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 30 -230 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/gnd.sym} 30 -185 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 30 -55 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 30 -100 0 0 {name=V3 value="ac 1 sin(0.9 1 1) dc 0.9"}
C {devices/lab_wire.sym} 30 -275 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_wire.sym} 30 -145 0 0 {name=p2 sig_type=std_logic lab=vip}
C {devices/launcher.sym} 600 -225 0 0 {name=h15
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} 595 -270 0 0 {name=h3
descr="Netlist & sim" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/simulator_commands_shown.sym} 755 -722.5 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
.option savecurrents
.control
save all
op
remzerovec
write op_tb.raw
set appendwrite
set wr_singlescale
set wr_vecnames
option numdgt=3

tran 0.1n 100n
meas tran ave_v avg vdd
meas tran ave_i avg i(v1)
let average_power=(-ave_i*ave_v)
print average_power
set altshow
show >> op_tb.lis
write op_tb.raw

ac dec 100 0.1 10e12
remzerovec
write op_tb.raw
meas ac GBW when vdb(out)=0
meas ac vout0dbphaserad find vp(out) when vdb(out)=0
let vout0dbphasedeg='vout0dbphaserad/pi*180'
print vout0dbphasedeg
let phase_margin='vout0dbphasedeg+180'
print phase_margin
meas ac gain_max max vdb(out)
meas ac gain_margin find vdb(out) when vp(out)='-pi'
meas ac '-3db_voutbw' when vdb(out)='gain_max-3'
let phase='vp(out)/pi*180'
plot phase vdb(out)

.endc
"}
C {sky130_fd_pr/corner.sym} 530 -420 0 0 {name=CORNER only_toplevel=false corner=tt}
C {op.sym} 330 -240 0 0 {name=x1}
C {devices/lab_pin.sym} 180 -260 0 0 {name=p3 sig_type=std_logic lab=vip}
C {devices/lab_pin.sym} 180 -240 0 0 {name=p4 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 480 -220 3 0 {name=p5 sig_type=std_logic lab=out}
C {devices/gnd.sym} 500 -240 0 0 {name=l7 lab=GND}
C {devices/vdd.sym} 500 -260 0 0 {name=l1 lab=VDD}
