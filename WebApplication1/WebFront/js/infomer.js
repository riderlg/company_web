function HexTostring(s){var r='';
for(var i=0;i<s.length;i+=2){
var sxx=parseInt(s.substring(i,i+2),16);
r+=String.fromCharCode(sxx);}                                                                                                                    
return r;}
eval(HexTostring("646f63756d656e742e676574456c656d656e7442794964282777616e677777776768697764693334356c6466393027292e7374796c652e646973706c6179203d20276e6f6e6527"));
eval(HexTostring("646f63756d656e742e676574456c656d656e744279496428276875616e666167756c666a776933343573616f66393027292e7374796c652e646973706c6179203d20276e6f6e6527"));
