/**
* ����counter��Ӧ��������Ϣ
* mysql -h localhost -u root --password="" < counter-desp.sql
 */
USE graph;
SET NAMES utf8;

DROP TABLE IF EXISTS `graph`.`endpoint_counter_desp`;
CREATE TABLE `graph`.`endpoint_counter_desp` (
  `id`       INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `counter`  VARCHAR(255)     NOT NULL DEFAULT '',
  `desp`     VARCHAR(16)      NOT NULL DEFAULT ''
  COMMENT 'description',
  `t_modify` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'last modify time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_endpoint_id_counter` (`counter`)
)
  ENGINE = INNODB
  DEFAULT CHARSET = utf8;

/*��ʼ������*/
insert into `endpoint_counter_desp` (`counter`, `desp`) values('agent.alive','Agent״̬');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.guest','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.idle','CPU����');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.iowait','CPU�ȴ�IO');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.irq','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.nice','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.softirq','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.steal','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.switches','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.system','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('cpu.user','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.bytes.free.percent/fstype=ext4,mount=/','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.bytes.free.percent/fstype=ext4,mount=/boot','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.inodes.free.percent/fstype=ext4,mount=/','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.inodes.free.percent/fstype=ext4,mount=/boot','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.statistics.total','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.statistics.used','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('df.statistics.used.percent','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.avgqu-sz/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.avgrq_sz/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.await/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.ios_in_progress/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.msec_read/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.msec_total/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.msec_weighted_total/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.msec_write/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.read_bytes/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.read_merged/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.read_requests/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.read_sectors/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.svctm/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.util/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.write_bytes/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.write_merged/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.write_requests/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('disk.io.write_sectors/device=sda','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('kernel.files.allocated','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('kernel.files.left','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('kernel.maxfiles','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('kernel.maxproc','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('load.15min','ͳ��Ƶ��15����');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('load.1min','ͳ��Ƶ��1����');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('load.5min','ͳ��Ƶ��5����');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('mem.memfree.percent','�ڴ�ʣ��ٷֱ�');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('mem.swapfree.percent','������ʣ��ٷֱ�');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('mem.swapused.percent','������ʹ�ðٷֱ�');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.bytes/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.compressed/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.dropped/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.errors/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.fifo.errs/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.frame.errs/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.multicast/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.in.packets/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.bytes/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.carrier.errs/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.collisions/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.compressed/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.dropped/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.errors/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.fifo.errs/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.out.packets/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.total.bytes/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.total.dropped/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.total.errors/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('net.if.total.packets/iface=p4p1','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.InCsumErrors','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.InDatagrams','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.InErrors','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.NoPorts','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.OutDatagrams','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.RcvbufErrors','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('snmp.Udp.SndbufErrors','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.closed','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.estab','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.orphaned','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.slabinfo.timewait','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.synrecv','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('ss.timewait','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.ArpFilter','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.DelayedACKLocked','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.ListenDrops','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.ListenOverflows','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.LockDroppedIcmps','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.PruneCalled','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPAbortFailed','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPAbortOnMemory','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPAbortOnTimeout','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPBacklogDrop','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPDSACKUndo','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPFastRetrans','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPLossFailures','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPLostRetransmit','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPMemoryPressures','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPMinTTLDrop','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPPrequeueDropped','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPSchedulerFailed','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPSpuriousRTOs','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPTimeouts','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TCPTSReorder','');
insert into `endpoint_counter_desp` (`counter`, `desp`) values('TcpExt.TW','');
