const maxp=99;
var n,m,e,cost,i:integer;
    f,g:text;
    b,d,trace:array[1..maxp]of integer;
    a:array[1..maxp,1..maxp]of boolean;
    c:array[1..maxp,1..maxp]of integer ;
    ktr:boolean;


procedure enter;
var u,v,co,i:integer;
begin
        assign(f,'dothicochutrinh.inp');reset(f);
        assign(g,'dothicochutrinh.out');rewrite(g);
        readln(f,n,m);
        e:=0;
        while not eoln(f) do
        begin
                inc(e);
                read(f,b[e]);
        end;
        fillchar(a,sizeof(a),false);
        fillchar(c,sizeof(c),maxp);
        for i:=1 to m do
        begin
                readln(f,u,v,co);
                a[u,v]:=true;
                a[v,u]:=true;
                c[u,v]:=co;
                c[v,u]:=co;
        end;
        ktr:=true;
        cost:=0;
end;
procedure kt(s:integer);
begin
        fillchar(d,sizeof(d),maxp);
        fillchar(trace,sizeof(trace),0);
        d[s]:=0;
end;
procedure bellman(s,fi:integer);
var stop:boolean;
        u,v:integer;
begin
        kt(s);
        repeat
                stop:=true;
                for u:=1 to n do
                        for v:=1 to n do
                        begin
                                if d[v]>d[u]+c[u,v] then
                                begin
                                        d[v]:=d[u]+c[u,v];
                                        trace[v]:=u;
                                        stop:=false;
                                end;
                        end;
        until stop;
        if d[fi]=maxp then ktr:=false
        else cost:=cost+d[fi];
        //print;
end;
{procedure print;
begin

end;}

BEGIN
        enter;
        for i:=1 to e-1 do
        begin
                if ktr=true then bellman(b[i],b[i+1])
                else
                begin
                        write(g,'sai');
                        break;
                end;
        end;
        if ktr=true then write(g,cost);
        close(f);
        close(g);

END.











