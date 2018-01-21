clear
a=6; b=4;
syms q w
c1 = [0 0];
prompt1 = 'Unesite koordinatu x: ';
x_input = input(prompt1);
prompt2 = 'Unesite koordinatu y: ';
y_input = input(prompt2);
x3 = a*cos(q)+b*cos(w) == x_input; 
y3 = a*sin(q)+b*sin(w) == y_input;

[teta, alfa] = solve([x3 y3], [q w]);  

teta = double(teta);
alfa = double(alfa);

if (y_input < 0)
    if x_input<0
        pick = 2;
    else 
        pick = 1;
    end
    i = -1;
    if (y_input<-b) || (x_input<0)
        alfa = radtodeg(alfa);
        alfa = 360-alfa;
        alfa = degtorad(alfa);
    else
        alfa = radtodeg(alfa);
        alfa = (180 - alfa)*2 + alfa;
        alfa = degtorad(-360 + alfa);
    end
else
    if y_input>2 && x_input>2
        pick = 1;
    else
        pick = 2;
        
    end
    i = 1;
end
if (x_input ~= 10 && x_input ~= 0) || (y_input ~= 10 && y_input ~= 0)
    for t=0:0.04:1

        c2 = a*[cos(teta(pick)*t) sin(teta(pick)*t)];
        c3 = [a*cos(teta(pick)*t)+b*cos(alfa(pick)*t*i) a*sin(teta(pick)*t)+b*sin(alfa(pick)*t*i)];
        c2 = double(c2);
        c3 = double(c3);
        axis([-10 10 -10 10]);
        osovina1 = line([c1(1) c2(1)],[c1(2) c2(2)]);
        osovina2 = line([c2(1) c3(1)],[c2(2) c3(2)]);
        c1_tacka = viscircles(c1, 0.1);
        c2_tacka = viscircles(c2, 0.1);
        c3_tacka = viscircles(c3, 0.1);
        pause(0.04);
        if (teta(pick)~=(teta(pick)*t)) && (alfa(pick)*i~=(alfa(pick)*t)*i)
            delete(osovina1);
            delete(osovina2);
            delete(c1_tacka);
            delete(c2_tacka);
            delete(c3_tacka);
            grid on
        end
    end
elseif x_input == 10
    c2 = [6 0];
    c3 = [10 0];
    c2 = double(c2);
    c3 = double(c3);
    axis([-10 10 -10 10]);
    osovina1 = line([c1(1) c2(1)],[c1(2) c2(2)]);
    osovina2 = line([c2(1) c3(1)],[c2(2) c3(2)]);
    c1_tacka = viscircles(c1, 0.1);
    c2_tacka = viscircles(c2, 0.1);
    c3_tacka = viscircles(c3, 0.1);
elseif y_input == 10
    c2 = [0 6];
    c3 = [0 10];
    c2 = double(c2);
    c3 = double(c3);
    axis([-10 10 -10 10]);
    osovina1 = line([c1(1) c2(1)],[c1(2) c2(2)]);
    osovina2 = line([c2(1) c3(1)],[c2(2) c3(2)]);
    c1_tacka = viscircles(c1, 0.1);
    c2_tacka = viscircles(c2, 0.1);
    c3_tacka = viscircles(c3, 0.1);
end