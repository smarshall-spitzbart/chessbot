%Points A1-A4
xInterval = (Board_Locations.A4.xyz(1)-Board_Locations.A1.xyz(1))/3;
yInterval = (Board_Locations.A4.xyz(2)-Board_Locations.A1.xyz(2))/3;
zInterval = (Board_Locations.A4.xyz(3)-Board_Locations.A1.xyz(3))/3;
additionvector1 = [xInterval yInterval zInterval 0 0];
Board_Locations.A2.xyz = [Board_Locations.A1.xyz(1:3) -pi/2 0] + additionvector1;
Board_Locations.A3.xyz = [Board_Locations.A4.xyz(1:3) -pi/2 0] - additionvector1;

%Points H1-H4
xInterval = (Board_Locations.H4.xyz(1)-Board_Locations.H1.xyz(1))/3;
yInterval = (Board_Locations.H4.xyz(2)-Board_Locations.H1.xyz(2))/3;
zInterval = (Board_Locations.H4.xyz(3)-Board_Locations.H1.xyz(3))/3;
additionvector2 = [xInterval yInterval zInterval 0 0];
Board_Locations.H2.xyz = [Board_Locations.H1.xyz(1:3) -pi/2 0] + additionvector2;
Board_Locations.H3.xyz = [Board_Locations.H4.xyz(1:3) -pi/2 0] - additionvector2;

%A1-H1
xInterval = (Board_Locations.A1.xyz(1)-Board_Locations.H1.xyz(1))/7;
yInterval = (Board_Locations.A1.xyz(2)-Board_Locations.H1.xyz(2))/7;
zInterval = (Board_Locations.A1.xyz(3)-Board_Locations.H1.xyz(3))/7;
additionvector3 = [xInterval yInterval zInterval -pi/2 0];
Board_Locations.G1.xyz = [Board_Locations.H1.xyz(1:3) 0 0] + additionvector3;
Board_Locations.F1.xyz = [Board_Locations.H1.xyz(1:3) 0 0] + 2*additionvector3;
Board_Locations.E1.xyz = [Board_Locations.H1.xyz(1:3) 0 0] + 3*additionvector3;
Board_Locations.D1.xyz = [Board_Locations.A1.xyz(1:3) 0 0] - 3*additionvector3;
Board_Locations.C1.xyz = [Board_Locations.A1.xyz(1:3) 0 0] - 2*additionvector3;
Board_Locations.B1.xyz = [Board_Locations.A1.xyz(1:3) 0 0] - additionvector3;

%A2-H2
xInterval = (Board_Locations.A2.xyz(1)-Board_Locations.H2.xyz(1))/7;
yInterval = (Board_Locations.A2.xyz(2)-Board_Locations.H2.xyz(2))/7;
zInterval = (Board_Locations.A2.xyz(3)-Board_Locations.H2.xyz(3))/7;
additionvector3 = [xInterval yInterval zInterval 0 0];
Board_Locations.G2.xyz = [Board_Locations.H2.xyz(1:3) -pi/2 0] + additionvector3;
Board_Locations.F2.xyz = [Board_Locations.H2.xyz(1:3) -pi/2 0] + 2*additionvector3;
Board_Locations.E2.xyz = [Board_Locations.H2.xyz(1:3) -pi/2 0] + 3*additionvector3;
Board_Locations.D2.xyz = [Board_Locations.A2.xyz(1:3) -pi/2 0] - 3*additionvector3;
Board_Locations.C2.xyz = [Board_Locations.A2.xyz(1:3) -pi/2 0] - 2*additionvector3;
Board_Locations.B2.xyz = [Board_Locations.A2.xyz(1:3) -pi/2 0] - additionvector3;

%A3-H3
xInterval = (Board_Locations.A3.xyz(1)-Board_Locations.H3.xyz(1))/7;
yInterval = (Board_Locations.A3.xyz(2)-Board_Locations.H3.xyz(2))/7;
zInterval = (Board_Locations.A3.xyz(3)-Board_Locations.H3.xyz(3))/7;
additionvector3 = [xInterval yInterval zInterval 0 0];
Board_Locations.G3.xyz = [Board_Locations.H3.xyz(1:3) -pi/2 0] + additionvector3;
Board_Locations.F3.xyz = [Board_Locations.H3.xyz(1:3) -pi/2 0] + 2*additionvector3;
Board_Locations.E3.xyz = [Board_Locations.H3.xyz(1:3) -pi/2 0] + 3*additionvector3;
Board_Locations.D3.xyz = [Board_Locations.A3.xyz(1:3) -pi/2 0] - 3*additionvector3;
Board_Locations.C3.xyz = [Board_Locations.A3.xyz(1:3) -pi/2 0] - 2*additionvector3;
Board_Locations.B3.xyz = [Board_Locations.A3.xyz(1:3) -pi/2 0] - additionvector3;

%A4-H4
additionvector4 = [Board_Locations.A4.xyz(1:3)-Board_Locations.H3.xyz(1:3) 0 0];
Board_Locations.G4.xyz = [Board_Locations.H4.xyz(1:3) -pi/2 0] + additionvector4;
Board_Locations.F4.xyz = [Board_Locations.H4.xyz(1:3) -pi/2 0] + 2*additionvector4;
Board_Locations.E4.xyz = [Board_Locations.H4.xyz(1:3) -pi/2 0] + 3*additionvector4;
Board_Locations.D4.xyz = [Board_Locations.A4.xyz(1:3) -pi/2 0] - 3*additionvector4;
Board_Locations.C4.xyz = [Board_Locations.A4.xyz(1:3) -pi/2 0] - 2*additionvector4;
Board_Locations.B4.xyz = [Board_Locations.A4.xyz(1:3) -pi/2 0] - additionvector4;