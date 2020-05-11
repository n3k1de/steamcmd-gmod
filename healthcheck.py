import socket, sys, time
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.settimeout(9.0)
s.connect((socket.gethostbyname(socket.gethostname()), int(sys.argv[1])))
try:
	s.send(b'\xFF\xFF\xFF\xFFTSource Engine Query\x00')
	s.recv(4096)
	
except socket.error as e:
	with open("/opt/server/socket.txt", "a+") as ffile:
		ffile.write(time.strftime('%Y-%m-%d %H:%M:%S')+':\t'+e)
		ffile.write('\n')
	raise SystemExit(1)
