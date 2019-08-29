clc,clear

y=[.1 .122 .126 .138 .15 .158 .183 .19 .199 .224 .251 .263 .275 .316 .334 .362 .397 .409 .5];

m=2.88;
f=830;

E_t=m*(1-y)+f*y;

E_b=m*f./(m*y+f*(1-y));

E_edu=[85.6 104 107 117 127 134 154 160 167 188 211 220 229 264 279 302 331 341 416];

hold on
plot(E_t,E_edu)
xlabel('E from upper gound Iso strain')
ylabel('E from edupack')

hold off