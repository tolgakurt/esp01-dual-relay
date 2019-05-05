<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.0.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="simple-parts">
<packages>
<package name="ESP8266E01">
<pad name="GND" x="-3.81" y="1.27" drill="0.9" diameter="2" shape="offset" rot="R90"/>
<pad name="IO2" x="-1.27" y="1.27" drill="0.9" diameter="2" shape="offset" rot="R90"/>
<pad name="IO0" x="1.27" y="1.27" drill="0.9" diameter="2" shape="offset" rot="R90"/>
<pad name="RX" x="3.81" y="1.27" drill="0.9" diameter="2" shape="offset" rot="R90"/>
<pad name="VCC" x="3.81" y="-1.27" drill="0.9" diameter="2" shape="offset" rot="R270"/>
<pad name="RST" x="1.27" y="-1.27" drill="0.9" diameter="2" shape="offset" rot="R270"/>
<pad name="CH" x="-1.27" y="-1.27" drill="0.9" diameter="2" shape="offset" rot="R270"/>
<pad name="TX" x="-3.81" y="-1.27" drill="0.9" diameter="2" shape="offset" rot="R270"/>
<text x="-3" y="5.34" size="1.27" layer="25">&gt;NAME</text>
<wire x1="-7.2" y1="-2.8" x2="7.2" y2="-2.8" width="0.127" layer="21"/>
<wire x1="7.2" y1="-2.8" x2="7.2" y2="22" width="0.127" layer="21"/>
<wire x1="7.2" y1="22" x2="-7.2" y2="22" width="0.127" layer="21"/>
<wire x1="-7.2" y1="22" x2="-7.2" y2="-2.8" width="0.127" layer="21"/>
<wire x1="-4.7" y1="9.2" x2="-4.7" y2="12.5" width="0.127" layer="21"/>
<wire x1="-4.7" y1="12.5" x2="-4.3" y2="12.5" width="0.127" layer="21"/>
<wire x1="-4.3" y1="12.5" x2="-1.7" y2="12.5" width="0.127" layer="21"/>
<wire x1="-1.7" y1="12.5" x2="-1.7" y2="9.2" width="0.127" layer="21"/>
<wire x1="-1.7" y1="9.2" x2="-4.7" y2="9.2" width="0.127" layer="21"/>
<wire x1="-4.3" y1="12.5" x2="-4.3" y2="20.9" width="0.127" layer="21"/>
<wire x1="-4.3" y1="20.9" x2="-2.3" y2="20.9" width="0.127" layer="21"/>
<wire x1="-2.3" y1="20.9" x2="-2.3" y2="17.1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="17.1" x2="-2.4" y2="17.1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="17.1" x2="-0.5" y2="17.1" width="0.127" layer="21"/>
<wire x1="-0.5" y1="17.1" x2="-0.5" y2="20.9" width="0.127" layer="21"/>
<wire x1="-0.5" y1="20.9" x2="1.3" y2="20.9" width="0.127" layer="21"/>
<wire x1="1.3" y1="20.9" x2="1.3" y2="17.2" width="0.127" layer="21"/>
<wire x1="1.3" y1="17.2" x2="3.5" y2="17.2" width="0.127" layer="21"/>
<wire x1="3.5" y1="17.2" x2="3.5" y2="20.8" width="0.127" layer="21"/>
</package>
<package name="ECAP3.2S4.0D">
<pad name="P+" x="-1.6" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="1.6" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="2.11" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="3.38" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="2" width="0.127" layer="21"/>
</package>
<package name="ECAP3.2S5.0D">
<pad name="P+" x="-1.6" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="1.6" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="2.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="4.1" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="2.5" width="0.127" layer="21"/>
</package>
<package name="CERCAP3.2S">
<pad name="P$1" x="-1.6" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="1.6" y="0" drill="0.9" diameter="2.5"/>
<text x="-2.54" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="2.54" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-3" y1="1.25" x2="3" y2="1.25" width="0.127" layer="21"/>
<wire x1="3" y1="-1.25" x2="-3" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-3" y1="1.25" x2="-3" y2="-1.25" width="0.127" layer="21"/>
<wire x1="3" y1="-1.25" x2="3" y2="1.25" width="0.127" layer="21"/>
</package>
<package name="CERCAP5.6S">
<pad name="P$1" x="-2.8" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="2.8" y="0" drill="0.9" diameter="2.5"/>
<text x="-2.54" y="2" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="3.27" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-3.5" y1="-1.7" x2="-3.5" y2="1.7" width="0.127" layer="21"/>
<wire x1="-3.5" y1="1.7" x2="3.5" y2="1.7" width="0.127" layer="21"/>
<wire x1="3.5" y1="1.7" x2="3.5" y2="-1.7" width="0.127" layer="21"/>
<wire x1="3.5" y1="-1.7" x2="-3.5" y2="-1.7" width="0.127" layer="21"/>
</package>
<package name="RD5.0S1.8D">
<wire x1="-1.6" y1="0.85" x2="1.6" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.6" y1="0.85" x2="1.6" y2="-0.85" width="0.127" layer="21"/>
<wire x1="1.6" y1="-0.85" x2="-1.6" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-0.85" x2="-1.6" y2="0.85" width="0.127" layer="21"/>
<pad name="P+" x="-2.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3" y="1.63" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="3" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="ZD6.0S2.0D">
<wire x1="-1.8" y1="1" x2="1.8" y2="1" width="0.127" layer="21"/>
<wire x1="1.8" y1="1" x2="1.8" y2="-1" width="0.127" layer="21"/>
<wire x1="1.8" y1="-1" x2="-1.8" y2="-1" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-1" x2="-1.8" y2="1" width="0.127" layer="21"/>
<pad name="P+" x="-3" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="3" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.2" y="1.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.2" y="2.87" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="LED3.2S5.0D">
<circle x="0" y="0" radius="2.5" width="0.127" layer="21"/>
<pad name="P+" x="-1.6" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="1.6" y="0" drill="0.9" diameter="2.5"/>
<text x="-2.23" y="2.5" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.23" y="3.87" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="HOR.25W">
<wire x1="-3.25" y1="1.25" x2="3.25" y2="1.25" width="0.127" layer="21"/>
<wire x1="3.25" y1="1.25" x2="3.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="3.25" y1="-1.25" x2="-3.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-3.25" y1="-1.25" x2="-3.25" y2="1.25" width="0.127" layer="21"/>
<pad name="P$1" x="-5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="5" y="0" drill="0.9" diameter="2.5"/>
<text x="-2.54" y="0" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="VER.25W">
<pad name="P$1" x="-3.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="0" y="0" drill="0.9" diameter="2.5"/>
<text x="-3" y="1.31" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="2.58" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-1.25" y1="1.25" x2="1.25" y2="1.25" width="0.127" layer="21"/>
<wire x1="1.25" y1="1.25" x2="1.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="1.25" y1="-1.25" x2="-1.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-1.25" y1="-1.25" x2="-1.25" y2="1.25" width="0.127" layer="21"/>
</package>
<package name="VER.50W">
<pad name="P$1" x="-3.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="0" y="0" drill="0.9" diameter="2.5"/>
<text x="-4.16" y="1.78" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.16" y="3.05" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-1.6" y1="1.6" x2="1.6" y2="1.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="1.6" x2="1.6" y2="-1.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="-1.6" x2="-1.6" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-1.6" y1="-1.6" x2="-1.6" y2="1.6" width="0.127" layer="21"/>
</package>
<package name="VER1.0W">
<pad name="P$1" x="-4" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="0" y="0" drill="0.9" diameter="2.5"/>
<text x="-4.41" y="2.55" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.41" y="3.82" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.127" layer="21"/>
</package>
<package name="RLY16W22L">
<wire x1="-8" y1="11" x2="8" y2="11" width="0.127" layer="21"/>
<wire x1="8" y1="11" x2="8" y2="-11" width="0.127" layer="21"/>
<wire x1="8" y1="-11" x2="-8" y2="-11" width="0.127" layer="21"/>
<wire x1="-8" y1="-11" x2="-8" y2="11" width="0.127" layer="21"/>
<pad name="P$1" x="-6" y="-7" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="6" y="-7" drill="0.9" diameter="2.5"/>
<pad name="COM" x="0" y="-9" drill="0.9" diameter="2.5"/>
<pad name="NC" x="-6" y="5.2" drill="0.9" diameter="2.5"/>
<pad name="NO" x="6" y="5.2" drill="0.9" diameter="2.5"/>
<text x="-2.7" y="2.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.7" y="0.6" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="PINPLUG1">
<pad name="P$1" x="0" y="0" drill="0.9" diameter="2" rot="R180"/>
<wire x1="-1.25" y1="1.25" x2="1.25" y2="1.25" width="0.127" layer="21"/>
<wire x1="1.25" y1="1.25" x2="1.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="1.25" y1="-1.25" x2="-1.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-1.25" y1="-1.25" x2="-1.25" y2="1.25" width="0.127" layer="21"/>
<text x="-2.9" y="1.45" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.9" y="2.7" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="PINPLUG2">
<pad name="P$1" x="-1.27" y="0" drill="0.9" diameter="2" rot="R180"/>
<pad name="P$2" x="1.27" y="0" drill="0.9" diameter="2"/>
<wire x1="-2.5" y1="1.25" x2="2.5" y2="1.25" width="0.127" layer="21"/>
<wire x1="2.5" y1="1.25" x2="2.5" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2.5" y1="-1.25" x2="-2.5" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-1.25" x2="-2.5" y2="1.25" width="0.127" layer="21"/>
<text x="-2.9" y="1.45" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.9" y="2.7" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CON3.0S2T">
<wire x1="-3.5" y1="3.5" x2="3.5" y2="3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="3.5" x2="3.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3.5" x2="-3.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="-3.5" y1="-3.5" x2="-3.5" y2="3.5" width="0.127" layer="21"/>
<pad name="P$1" x="-1.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="1.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.2" y="1.7" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="CON5.0S2T">
<pad name="P$1" x="-2.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="2.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.2" y="1.7" size="1.27" layer="25">&gt;NAME</text>
<wire x1="-5" y1="3.7" x2="5" y2="3.7" width="0.127" layer="21"/>
<wire x1="5" y1="3.7" x2="5" y2="-3.7" width="0.127" layer="21"/>
<wire x1="5" y1="-3.7" x2="-5" y2="-3.7" width="0.127" layer="21"/>
<wire x1="-5" y1="-3.7" x2="-5" y2="3.7" width="0.127" layer="21"/>
</package>
<package name="CON3.0S3T">
<wire x1="-3.5" y1="3.5" x2="3.5" y2="3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3.5" x2="-3.5" y2="-3.5" width="0.127" layer="21"/>
<pad name="P$1" x="-3" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="0" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.2" y="1.7" size="1.27" layer="25">&gt;NAME</text>
<pad name="P$3" x="3" y="0" drill="0.9" diameter="2.5"/>
<wire x1="-3.5" y1="3.5" x2="-5.3" y2="3.5" width="0.127" layer="21"/>
<wire x1="-5.3" y1="3.5" x2="-5.3" y2="-3.5" width="0.127" layer="21"/>
<wire x1="-5.3" y1="-3.5" x2="-3.5" y2="-3.5" width="0.127" layer="21"/>
<wire x1="3.5" y1="-3.5" x2="5.3" y2="-3.5" width="0.127" layer="21"/>
<wire x1="5.3" y1="-3.5" x2="5.3" y2="3.5" width="0.127" layer="21"/>
<wire x1="5.3" y1="3.5" x2="3.5" y2="3.5" width="0.127" layer="21"/>
</package>
<package name="CON5.0S3T">
<pad name="P$1" x="-5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="0" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.2" y="1.7" size="1.27" layer="25">&gt;NAME</text>
<wire x1="-5" y1="3.7" x2="5" y2="3.7" width="0.127" layer="21"/>
<wire x1="5" y1="-3.7" x2="-5" y2="-3.7" width="0.127" layer="21"/>
<pad name="P$3" x="5" y="0" drill="0.9" diameter="2.5"/>
<wire x1="-5" y1="3.7" x2="-7.5" y2="3.7" width="0.127" layer="21"/>
<wire x1="-7.5" y1="3.7" x2="-7.5" y2="-3.7" width="0.127" layer="21"/>
<wire x1="-7.5" y1="-3.7" x2="-5" y2="-3.7" width="0.127" layer="21"/>
<wire x1="5" y1="-3.7" x2="7.5" y2="-3.7" width="0.127" layer="21"/>
<wire x1="7.5" y1="-3.7" x2="7.5" y2="3.7" width="0.127" layer="21"/>
<wire x1="7.5" y1="3.7" x2="5" y2="3.7" width="0.127" layer="21"/>
</package>
<package name="ECAP5.8S10.0D">
<pad name="P+" x="-2.9" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.9" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.36" y="1.45" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.36" y="2.7" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="5" width="0.127" layer="21"/>
</package>
<package name="ECAP5.8S13.2D">
<pad name="P+" x="-2.9" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.9" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.36" y="1.51" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.36" y="2.78" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="6.6" width="0.127" layer="21"/>
</package>
<package name="ECAP5.8S5.2D">
<pad name="P+" x="-2.9" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.9" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="2.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="4" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="2.6" width="0.127" layer="21"/>
</package>
<package name="ECAP5.8S6.4D">
<pad name="P+" x="-2.9" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.9" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.26" y="3.2" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.26" y="4.5" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="3.2" width="0.127" layer="21"/>
</package>
<package name="ECAP5.8S8.0D">
<pad name="P+" x="-2.9" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="2.9" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="4.1" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="5.38" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="4" width="0.127" layer="21"/>
</package>
<package name="TANCAP17.0S">
<pad name="P$1" x="-8.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="8.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="0.38" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="-1.69" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-8.5" y1="4.5" x2="8.5" y2="4.5" width="0.127" layer="21"/>
<wire x1="8.5" y1="4.5" x2="8.5" y2="-4.5" width="0.127" layer="21"/>
<wire x1="8.5" y1="-4.5" x2="-8.5" y2="-4.5" width="0.127" layer="21"/>
<wire x1="-8.5" y1="-4.5" x2="-8.5" y2="4.5" width="0.127" layer="21"/>
</package>
<package name="RD8.0S2.6D">
<wire x1="-2.5" y1="1.3" x2="2.5" y2="1.3" width="0.127" layer="21"/>
<wire x1="2.5" y1="1.3" x2="2.5" y2="-1.3" width="0.127" layer="21"/>
<wire x1="2.5" y1="-1.3" x2="-2.5" y2="-1.3" width="0.127" layer="21"/>
<wire x1="-2.5" y1="-1.3" x2="-2.5" y2="1.3" width="0.127" layer="21"/>
<pad name="P+" x="-4" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="4" y="0" drill="0.9" diameter="2.5"/>
<text x="-3" y="1.63" size="1.27" layer="25">&gt;NAME</text>
<text x="-3" y="3" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="RD9.5S3.2D">
<pad name="P+" x="-4.75" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="4.75" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.3" y="1.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.3" y="3" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-3.2" y1="1.6" x2="3.2" y2="1.6" width="0.127" layer="21"/>
<wire x1="3.2" y1="1.6" x2="3.2" y2="-1.6" width="0.127" layer="21"/>
<wire x1="3.2" y1="-1.6" x2="-3.2" y2="-1.6" width="0.127" layer="21"/>
<wire x1="-3.2" y1="-1.6" x2="-3.2" y2="1.6" width="0.127" layer="21"/>
</package>
<package name="RD14.0S5.2D">
<pad name="P+" x="-7" y="0" drill="0.9" diameter="2.5"/>
<pad name="P-" x="7" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.6" y="0.4" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.6" y="-1.6" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-4.6" y1="2.6" x2="4.6" y2="2.6" width="0.127" layer="21"/>
<wire x1="4.6" y1="2.6" x2="4.6" y2="-2.6" width="0.127" layer="21"/>
<wire x1="4.6" y1="-2.6" x2="-4.6" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-4.6" y1="-2.6" x2="-4.6" y2="2.6" width="0.127" layer="21"/>
</package>
<package name="HOR.50W">
<wire x1="-4.25" y1="1.75" x2="4.25" y2="1.75" width="0.127" layer="21"/>
<wire x1="4.25" y1="1.75" x2="4.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="4.25" y1="-1.75" x2="-4.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="-4.25" y1="-1.75" x2="-4.25" y2="1.75" width="0.127" layer="21"/>
<pad name="P$1" x="-6" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="6" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.81" y="0" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="HOR1.0W">
<pad name="P$1" x="-7.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="7.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.81" y="0" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-5.5" y1="2.5" x2="5.5" y2="2.5" width="0.127" layer="21"/>
<wire x1="5.5" y1="2.5" x2="5.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="5.5" y1="-2.5" x2="-5.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="-5.5" y1="-2.5" x2="-5.5" y2="2.5" width="0.127" layer="21"/>
</package>
<package name="FUSEMOUNT15.0S">
<pad name="P$1" x="-7.5" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="7.5" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.16" y="0.38" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.16" y="-1.69" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="-11.5" y1="4.5" x2="11.5" y2="4.5" width="0.127" layer="21"/>
<wire x1="11.5" y1="4.5" x2="11.5" y2="-4.5" width="0.127" layer="21"/>
<wire x1="11.5" y1="-4.5" x2="-11.5" y2="-4.5" width="0.127" layer="21"/>
<wire x1="-11.5" y1="-4.5" x2="-11.5" y2="4.5" width="0.127" layer="21"/>
</package>
<package name="SHORT5">
<pad name="P$1" x="-4" y="0" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="4" y="0" drill="0.9" diameter="2.5"/>
</package>
<package name="RLY15W19L">
<wire x1="-7.5" y1="9.5" x2="7.5" y2="9.5" width="0.127" layer="21"/>
<wire x1="7.5" y1="9.5" x2="7.5" y2="-9.5" width="0.127" layer="21"/>
<wire x1="7.5" y1="-9.5" x2="-7.5" y2="-9.5" width="0.127" layer="21"/>
<wire x1="-7.5" y1="-9.5" x2="-7.5" y2="9.5" width="0.127" layer="21"/>
<pad name="P$1" x="-6" y="-6" drill="0.9" diameter="2.5"/>
<pad name="P$2" x="6" y="-6" drill="0.9" diameter="2.5"/>
<pad name="COM" x="0" y="-7.4" drill="0.9" diameter="2.5"/>
<pad name="NC" x="-6" y="6" drill="0.9" diameter="2.5"/>
<pad name="NO" x="6" y="6" drill="0.9" diameter="2.5"/>
<text x="-2.7" y="2.7" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.7" y="0.6" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TO92" urn="urn:adsk.eagle:footprint:29726/1" locally_modified="yes">
<description>&lt;b&gt;TO 92&lt;/b&gt;</description>
<wire x1="-2.0946" y1="-1.651" x2="-2.6549" y2="-0.254" width="0.127" layer="21" curve="-32.781"/>
<wire x1="-2.6549" y1="-0.254" x2="-0.7863" y2="2.5485" width="0.127" layer="21" curve="-78.3185"/>
<wire x1="0.7863" y1="2.5484" x2="2.0945" y2="-1.651" width="0.127" layer="21" curve="-111.1"/>
<wire x1="-2.0945" y1="-1.651" x2="2.0945" y2="-1.651" width="0.127" layer="21"/>
<wire x1="-2.2537" y1="-0.254" x2="-0.2863" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-2.6549" y1="-0.254" x2="-2.2537" y2="-0.254" width="0.127" layer="21"/>
<wire x1="-0.2863" y1="-0.254" x2="0.2863" y2="-0.254" width="0.127" layer="21"/>
<wire x1="2.2537" y1="-0.254" x2="2.6549" y2="-0.254" width="0.127" layer="21"/>
<wire x1="0.2863" y1="-0.254" x2="2.2537" y2="-0.254" width="0.127" layer="51"/>
<wire x1="-0.7863" y1="2.5485" x2="0.7863" y2="2.5485" width="0.127" layer="51" curve="-34.2936"/>
<pad name="1" x="1.7" y="0" drill="0.9" diameter="2.5"/>
<pad name="2" x="0" y="3" drill="0.9" diameter="2.5"/>
<pad name="3" x="-1.7" y="0" drill="0.9" diameter="2.5"/>
<text x="-3.025" y="-3.065" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.025" y="-4.57" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO18" urn="urn:adsk.eagle:footprint:29724/1" locally_modified="yes">
<description>&lt;b&gt;TO 18&lt;/b&gt;</description>
<wire x1="-3.937" y1="-0.508" x2="-3.937" y2="0.508" width="0.127" layer="21"/>
<wire x1="-3.937" y1="-0.508" x2="-2.8765" y2="-0.508" width="0.127" layer="21"/>
<wire x1="-3.937" y1="0.508" x2="-2.8765" y2="0.508" width="0.127" layer="21"/>
<circle x="0" y="0" radius="2.921" width="0.127" layer="21"/>
<pad name="1" x="-1.6" y="-1.6" drill="0.9" diameter="2.5"/>
<pad name="2" x="1.6" y="-1.6" drill="0.9" diameter="2.5"/>
<pad name="3" x="1.6" y="1.6" drill="0.9" diameter="2.5"/>
<text x="-3.125" y="3.1" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.125" y="4.465" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="ESP8266E01">
<pin name="GND" x="-7.62" y="10.16" visible="pin" length="short" rot="R270"/>
<pin name="IO2" x="-2.54" y="10.16" visible="pin" length="short" rot="R270"/>
<pin name="IO0" x="2.54" y="10.16" visible="pin" length="short" rot="R270"/>
<pin name="RX" x="7.62" y="10.16" visible="pin" length="short" rot="R270"/>
<pin name="VCC" x="7.62" y="-10.16" visible="pin" length="short" rot="R90"/>
<pin name="RST" x="2.54" y="-10.16" visible="pin" length="short" rot="R90"/>
<pin name="CH" x="-2.54" y="-10.16" visible="pin" length="short" rot="R90"/>
<pin name="TX" x="-7.62" y="-10.16" visible="pin" length="short" rot="R90"/>
<text x="-10.16" y="-2.54" size="1.778" layer="95" rot="R90">&gt;NAME</text>
</symbol>
<symbol name="ECAPACITOR">
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<pin name="P+" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P-" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="2.54" width="0.254" layer="94" curve="-180"/>
<wire x1="-4.318" y1="1.27" x2="-3.302" y2="1.27" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.778" x2="-3.81" y2="0.762" width="0.254" layer="94"/>
</symbol>
<symbol name="CAPACITOR">
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<pin name="P$1" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="RECTDIODE">
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-2.62" y1="-2.54" x2="-2.62" y2="2.54" width="0.254" layer="94"/>
<pin name="P+" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P-" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-2.6" y1="2.5" x2="2.6" y2="0" width="0.254" layer="94"/>
<wire x1="2.6" y1="0" x2="-2.6" y2="-2.5" width="0.254" layer="94"/>
<wire x1="2.48" y1="-2.54" x2="2.48" y2="2.54" width="0.254" layer="94"/>
<wire x1="-4.318" y1="1.524" x2="-3.302" y2="1.524" width="0.254" layer="94"/>
<wire x1="-3.81" y1="2.032" x2="-3.81" y2="1.016" width="0.254" layer="94"/>
</symbol>
<symbol name="ZENDIODE">
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-2.62" y1="-2.54" x2="-2.62" y2="2.54" width="0.254" layer="94"/>
<pin name="P+" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P-" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-2.6" y1="2.5" x2="2.6" y2="0" width="0.254" layer="94"/>
<wire x1="2.6" y1="0" x2="-2.6" y2="-2.5" width="0.254" layer="94"/>
<wire x1="2.48" y1="-2.54" x2="2.48" y2="2.54" width="0.254" layer="94"/>
<wire x1="-4.318" y1="1.524" x2="-3.302" y2="1.524" width="0.254" layer="94"/>
<wire x1="-3.81" y1="2.032" x2="-3.81" y2="1.016" width="0.254" layer="94"/>
<wire x1="2.5" y1="2.6" x2="1.6" y2="2.6" width="0.254" layer="94"/>
<wire x1="2.5" y1="-2.6" x2="3.4" y2="-2.6" width="0.254" layer="94"/>
</symbol>
<symbol name="LED">
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-2.62" y1="-2.54" x2="-2.62" y2="2.54" width="0.254" layer="94"/>
<pin name="P+" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="P-" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-2.6" y1="2.5" x2="2.6" y2="0" width="0.254" layer="94"/>
<wire x1="2.6" y1="0" x2="-2.6" y2="-2.5" width="0.254" layer="94"/>
<wire x1="2.48" y1="-2.54" x2="2.48" y2="2.54" width="0.254" layer="94"/>
<wire x1="-4.318" y1="1.524" x2="-3.302" y2="1.524" width="0.254" layer="94"/>
<wire x1="-3.81" y1="2.032" x2="-3.81" y2="1.016" width="0.254" layer="94"/>
<wire x1="-1.9" y1="-2.6" x2="-0.5" y2="-4" width="0.254" layer="94"/>
<wire x1="-0.5" y1="-4" x2="-0.5" y2="-3.4" width="0.254" layer="94"/>
<wire x1="-0.8" y1="-2.1" x2="0.5" y2="-3.4" width="0.254" layer="94"/>
<wire x1="0.5" y1="-3.4" x2="0.5" y2="-2.8" width="0.254" layer="94"/>
<wire x1="0.2" y1="-1.6" x2="1.5" y2="-2.9" width="0.254" layer="94"/>
<wire x1="1.5" y1="-2.9" x2="1.5" y2="-2.2" width="0.254" layer="94"/>
</symbol>
<symbol name="RESISTOR">
<text x="-4.572" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.572" y="-2.032" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="-2.54" x2="-5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="2.54" width="0.254" layer="94"/>
<pin name="P$1" x="-7.62" y="0" visible="off" length="short" direction="pas"/>
<pin name="P$2" x="7.62" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="RELAY5PIN">
<pin name="P$1" x="-2.54" y="-10.16" visible="pin" length="short" direction="pas" rot="R90"/>
<pin name="P$2" x="2.54" y="-10.16" visible="pin" length="short" direction="pas" rot="R90"/>
<pin name="COM" x="0" y="7.62" visible="pin" length="short" rot="R270"/>
<pin name="NC" x="-2.54" y="7.62" visible="pin" length="short" rot="R270"/>
<pin name="NO" x="2.54" y="7.62" visible="pin" length="short" rot="R270"/>
<wire x1="5" y1="-7.5" x2="5" y2="5" width="0.254" layer="94"/>
<wire x1="5" y1="5" x2="-5" y2="5" width="0.254" layer="94"/>
<wire x1="-5" y1="5" x2="-5" y2="-7.5" width="0.254" layer="94"/>
<text x="-5.08" y="-5.08" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<wire x1="-5" y1="-7.5" x2="5" y2="-7.5" width="0.254" layer="94"/>
<text x="-7.62" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="CON1">
<pin name="P$1" x="0" y="0" visible="pin" length="short" rot="R90"/>
<text x="-1.27" y="0" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="0" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="CON2">
<pin name="P$1" x="0" y="0" visible="pin" length="short" rot="R90"/>
<pin name="P$2" x="2.54" y="0" visible="pin" length="short" rot="R90"/>
<text x="-1.27" y="0" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="0" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="CON3">
<pin name="P$1" x="0" y="0" visible="pin" length="short" rot="R90"/>
<pin name="P$2" x="2.54" y="0" visible="pin" length="short" rot="R90"/>
<text x="-1.27" y="0" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<pin name="P$3" x="5.08" y="0" visible="pin" length="short" rot="R90"/>
<text x="-3.81" y="0" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="+3V3">
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-3.81" y="0.635" size="1.778" layer="96" ratio="12">&gt;VALUE</text>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
</symbol>
<symbol name="GND">
<pin name="GND" x="0" y="2.54" visible="off" length="point" direction="sup" rot="R270"/>
<text x="-2.2225" y="-2.54" size="1.778" layer="96" ratio="12">&gt;VALUE</text>
<wire x1="1.1113" y1="1.5875" x2="0" y2="1.5875" width="0.254" layer="94"/>
<wire x1="0" y1="1.5875" x2="-1.1113" y2="1.5875" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.5875" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0.7938" x2="-0.635" y2="0.7938" width="0.254" layer="94"/>
<wire x1="0.1587" y1="0" x2="-0.1588" y2="0" width="0.254" layer="94"/>
</symbol>
<symbol name="BJTPNP">
<description>Bipolar PNP Transistor</description>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-3.302" x2="0" y2="-2.032" width="0.254" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="2.286" width="0.254" layer="94"/>
<wire x1="0" y1="2.286" x2="0" y2="3.302" width="0.254" layer="94"/>
<wire x1="0" y1="-2.032" x2="2.54" y2="-4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="-4.064" x2="2.54" y2="-5.334" width="0.254" layer="94"/>
<wire x1="0" y1="2.286" x2="2.54" y2="4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="4.064" x2="2.54" y2="5.334" width="0.254" layer="94"/>
<wire x1="0.762" y1="2.794" x2="0.762" y2="3.556" width="0.254" layer="94"/>
<wire x1="0.762" y1="2.794" x2="1.524" y2="2.794" width="0.254" layer="94"/>
<pin name="B" x="-5.08" y="0" visible="pin" length="short"/>
<pin name="C" x="2.54" y="-7.62" visible="pin" length="short" rot="R90"/>
<pin name="E" x="2.54" y="7.62" visible="pin" length="short" rot="R270"/>
<circle x="0.762" y="0" radius="4.572" width="0.254" layer="94"/>
<text x="5.08" y="-5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP8266E01" prefix="ESP8266E01">
<gates>
<gate name="G$1" symbol="ESP8266E01" x="0" y="0"/>
</gates>
<devices>
<device name="ESP8266E01" package="ESP8266E01">
<connects>
<connect gate="G$1" pin="CH" pad="CH"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="IO0" pad="IO0"/>
<connect gate="G$1" pin="IO2" pad="IO2"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="TX" pad="TX"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ECAPACITOR" prefix="EC" uservalue="yes">
<gates>
<gate name="G$1" symbol="ECAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="ECAP3.2S4.0D" package="ECAP3.2S4.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP3.2S5.0D" package="ECAP3.2S5.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP5.8S10.0D" package="ECAP5.8S10.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP5.8S13.2D" package="ECAP5.8S13.2D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP5.8S5.2D" package="ECAP5.8S5.2D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP5.8S6.4D" package="ECAP5.8S6.4D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECAP5.8S8.0D" package="ECAP5.8S8.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAPACITOR" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="CERCAP3.2S" package="CERCAP3.2S">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CERCAP5.6S" package="CERCAP5.6S">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TANCAP17.0S" package="TANCAP17.0S">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RECTDIODE" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="RECTDIODE" x="0" y="0"/>
</gates>
<devices>
<device name="RD8.0S2.6D" package="RD8.0S2.6D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RD9.5S3.2D" package="RD9.5S3.2D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RD14.0S5.2D" package="RD14.0S5.2D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RD5.0S1.8D" package="RD5.0S1.8D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ZENDIODE" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="ZENDIODE" x="0" y="0"/>
</gates>
<devices>
<device name="ZD6.0S2.0D" package="ZD6.0S2.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="LED" uservalue="yes">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="LED3.2S5.0D" package="LED3.2S5.0D">
<connects>
<connect gate="G$1" pin="P+" pad="P+"/>
<connect gate="G$1" pin="P-" pad="P-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="HOR.25W" package="HOR.25W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HOR.50W" package="HOR.50W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HOR1.0W" package="HOR1.0W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VER.25W" package="VER.25W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VER.50W" package="VER.50W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VER1.0W" package="VER1.0W">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RELAY5" prefix="RLY" uservalue="yes">
<gates>
<gate name="G$1" symbol="RELAY5PIN" x="0" y="0"/>
</gates>
<devices>
<device name="RLY15W19L" package="RLY15W19L">
<connects>
<connect gate="G$1" pin="COM" pad="COM"/>
<connect gate="G$1" pin="NC" pad="NC"/>
<connect gate="G$1" pin="NO" pad="NO"/>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RLY16W22L" package="RLY16W22L">
<connects>
<connect gate="G$1" pin="COM" pad="COM"/>
<connect gate="G$1" pin="NC" pad="NC"/>
<connect gate="G$1" pin="NO" pad="NO"/>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON1" prefix="CON" uservalue="yes">
<gates>
<gate name="G$1" symbol="CON1" x="0" y="0"/>
</gates>
<devices>
<device name="PINPLUG1" package="PINPLUG1">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON2" prefix="CON">
<gates>
<gate name="G$1" symbol="CON2" x="0" y="0"/>
</gates>
<devices>
<device name="PINPLUG2" package="PINPLUG2">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CON3.0S2T" package="CON3.0S2T">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CON5.0S2T" package="CON5.0S2T">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="FUSEMOUNT15.0S" package="FUSEMOUNT15.0S">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SHORT5" package="SHORT5">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON3" prefix="CON">
<gates>
<gate name="G$1" symbol="CON3" x="0" y="0"/>
</gates>
<devices>
<device name="CON3.0S3T" package="CON3.0S3T">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CON5.0S3T" package="CON5.0S3T">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" prefix="V">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="V">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BJTPNP" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="BJTPNP" x="0" y="0"/>
</gates>
<devices>
<device name="TO92" package="TO92">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="1"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO18" package="TO18">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0.45" drill="0">
<clearance class="0" value="0.45"/>
</class>
<class number="1" name="ac" width="1" drill="0">
<clearance class="1" value="1"/>
</class>
</classes>
<parts>
<part name="ESP8266-01" library="simple-parts" deviceset="ESP8266E01" device="ESP8266E01"/>
<part name="D3" library="simple-parts" deviceset="RECTDIODE" device="RD5.0S1.8D" value="1N4148"/>
<part name="D4" library="simple-parts" deviceset="RECTDIODE" device="RD5.0S1.8D" value="1N4148"/>
<part name="D5" library="simple-parts" deviceset="ZENDIODE" device="ZD6.0S2.0D" value="3V3"/>
<part name="D6" library="simple-parts" deviceset="ZENDIODE" device="ZD6.0S2.0D" value="3V3"/>
<part name="LED1" library="simple-parts" deviceset="LED" device="LED3.2S5.0D"/>
<part name="LED2" library="simple-parts" deviceset="LED" device="LED3.2S5.0D"/>
<part name="R3" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="100R"/>
<part name="R4" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="100R"/>
<part name="RLY1" library="simple-parts" deviceset="RELAY5" device="RLY15W19L" value="3V3"/>
<part name="RLY2" library="simple-parts" deviceset="RELAY5" device="RLY15W19L" value="3V3"/>
<part name="R5" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="3K3"/>
<part name="R6" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="3K3"/>
<part name="R7" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="3K3"/>
<part name="SW1+" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="SW2+" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="SWRX+" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="TXOUT" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="SW12-" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="SWRX-" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="ACIN" library="simple-parts" deviceset="CON2" device="CON5.0S2T" value=""/>
<part name="ACOUT" library="simple-parts" deviceset="CON3" device="CON5.0S3T" value=""/>
<part name="EC2" library="simple-parts" deviceset="ECAPACITOR" device="ECAP3.2S5.0D" value="220uF/16V"/>
<part name="C2" library="simple-parts" deviceset="CAPACITOR" device="CERCAP5.6S" value="100nF"/>
<part name="V3" library="simple-parts" deviceset="GND" device=""/>
<part name="V9" library="simple-parts" deviceset="+3V3" device=""/>
<part name="R8" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="2K2"/>
<part name="R9" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="2K2"/>
<part name="V2" library="simple-parts" deviceset="GND" device=""/>
<part name="V5" library="simple-parts" deviceset="GND" device=""/>
<part name="V7" library="simple-parts" deviceset="GND" device=""/>
<part name="EC1" library="simple-parts" deviceset="ECAPACITOR" device="ECAP3.2S5.0D" value="100uF/16V"/>
<part name="V8" library="simple-parts" deviceset="GND" device=""/>
<part name="V6" library="simple-parts" deviceset="GND" device=""/>
<part name="C1" library="simple-parts" deviceset="CAPACITOR" device="CERCAP3.2S" value="15pF"/>
<part name="SWRST+" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="SWRST-" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="V4" library="simple-parts" deviceset="+3V3" device=""/>
<part name="D7" library="simple-parts" deviceset="ZENDIODE" device="ZD6.0S2.0D" value="3V3"/>
<part name="V1" library="simple-parts" deviceset="+3V3" device=""/>
<part name="3V3IN" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="GNDIN" library="simple-parts" deviceset="CON1" device="PINPLUG1"/>
<part name="Q1" library="simple-parts" deviceset="BJTPNP" device="TO92" value="2N3906"/>
<part name="Q2" library="simple-parts" deviceset="BJTPNP" device="TO92" value="2N3906"/>
<part name="R1" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="470R"/>
<part name="R2" library="simple-parts" deviceset="RESISTOR" device="HOR.25W" value="470R"/>
<part name="D1" library="simple-parts" deviceset="RECTDIODE" device="RD5.0S1.8D" value="1N4148"/>
<part name="D2" library="simple-parts" deviceset="RECTDIODE" device="RD5.0S1.8D" value="1N4148"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="ESP8266-01" gate="G$1" x="15.24" y="25.4" rot="R270"/>
<instance part="D3" gate="G$1" x="58.42" y="71.12" rot="R270"/>
<instance part="D4" gate="G$1" x="58.42" y="-20.32" rot="MR90"/>
<instance part="D5" gate="G$1" x="58.42" y="53.34" rot="MR90"/>
<instance part="D6" gate="G$1" x="58.42" y="-2.54" rot="R270"/>
<instance part="LED1" gate="G$1" x="48.26" y="53.34" rot="R90"/>
<instance part="LED2" gate="G$1" x="48.26" y="-2.54" rot="MR270"/>
<instance part="R3" gate="G$1" x="48.26" y="68.58" rot="R90"/>
<instance part="R4" gate="G$1" x="48.26" y="-17.78" rot="R90"/>
<instance part="RLY1" gate="G$1" x="73.66" y="58.42" rot="MR90"/>
<instance part="RLY2" gate="G$1" x="73.66" y="-7.62" rot="R270"/>
<instance part="R5" gate="G$1" x="-7.62" y="22.86"/>
<instance part="R6" gate="G$1" x="-7.62" y="27.94"/>
<instance part="R7" gate="G$1" x="-7.62" y="33.02"/>
<instance part="SW1+" gate="G$1" x="40.64" y="40.64"/>
<instance part="SW2+" gate="G$1" x="40.64" y="10.16" rot="R180"/>
<instance part="SWRX+" gate="G$1" x="25.4" y="12.7" rot="R90"/>
<instance part="TXOUT" gate="G$1" x="5.08" y="45.72"/>
<instance part="SW12-" gate="G$1" x="30.48" y="-12.7"/>
<instance part="SWRX-" gate="G$1" x="15.24" y="-12.7"/>
<instance part="ACIN" gate="G$1" x="88.9" y="25.4"/>
<instance part="ACOUT" gate="G$1" x="99.06" y="25.4"/>
<instance part="EC2" gate="G$1" x="7.62" y="71.12" rot="R270"/>
<instance part="C2" gate="G$1" x="17.78" y="71.12" rot="R270"/>
<instance part="V3" gate="G$1" x="-20.32" y="66.04" rot="R270"/>
<instance part="V9" gate="G$1" x="-20.32" y="33.02" rot="R90"/>
<instance part="R8" gate="G$1" x="-7.62" y="38.1"/>
<instance part="R9" gate="G$1" x="-7.62" y="43.18"/>
<instance part="V2" gate="G$1" x="22.86" y="-20.32"/>
<instance part="V5" gate="G$1" x="71.12" y="76.2" rot="R90"/>
<instance part="V7" gate="G$1" x="71.12" y="-25.4" rot="R90"/>
<instance part="EC1" gate="G$1" x="-2.54" y="15.24" rot="R180"/>
<instance part="V8" gate="G$1" x="25.4" y="45.72" rot="R180"/>
<instance part="V6" gate="G$1" x="-10.16" y="12.7"/>
<instance part="C1" gate="G$1" x="27.94" y="71.12" rot="R270"/>
<instance part="SWRST+" gate="G$1" x="2.54" y="5.08" rot="R90"/>
<instance part="SWRST-" gate="G$1" x="22.86" y="-12.7"/>
<instance part="V4" gate="G$1" x="-20.32" y="76.2" rot="R90"/>
<instance part="D7" gate="G$1" x="-2.54" y="71.12" rot="R90"/>
<instance part="V1" gate="G$1" x="73.66" y="25.4" rot="R270"/>
<instance part="3V3IN" gate="G$1" x="-12.7" y="76.2"/>
<instance part="GNDIN" gate="G$1" x="-12.7" y="66.04" rot="R180"/>
<instance part="Q1" gate="G$1" x="60.96" y="33.02" rot="MR180"/>
<instance part="Q2" gate="G$1" x="60.96" y="17.78"/>
<instance part="R1" gate="G$1" x="48.26" y="33.02"/>
<instance part="R2" gate="G$1" x="48.26" y="17.78"/>
<instance part="D1" gate="G$1" x="35.56" y="33.02" rot="R180"/>
<instance part="D2" gate="G$1" x="35.56" y="17.78" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="EC1" gate="G$1" pin="P-"/>
<pinref part="V6" gate="G$1" pin="GND"/>
<wire x1="-7.62" y1="15.24" x2="-10.16" y2="15.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="P$2"/>
<pinref part="D3" gate="G$1" pin="P+"/>
<wire x1="48.26" y1="76.2" x2="58.42" y2="76.2" width="0.1524" layer="91"/>
<pinref part="V5" gate="G$1" pin="GND"/>
<wire x1="58.42" y1="76.2" x2="63.5" y2="76.2" width="0.1524" layer="91"/>
<junction x="58.42" y="76.2"/>
<pinref part="RLY1" gate="G$1" pin="P$2"/>
<wire x1="63.5" y1="76.2" x2="68.58" y2="76.2" width="0.1524" layer="91"/>
<wire x1="63.5" y1="60.96" x2="63.5" y2="76.2" width="0.1524" layer="91"/>
<junction x="63.5" y="76.2"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="P$1"/>
<pinref part="D4" gate="G$1" pin="P+"/>
<wire x1="48.26" y1="-25.4" x2="58.42" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="V7" gate="G$1" pin="GND"/>
<wire x1="58.42" y1="-25.4" x2="63.5" y2="-25.4" width="0.1524" layer="91"/>
<junction x="58.42" y="-25.4"/>
<pinref part="RLY2" gate="G$1" pin="P$2"/>
<wire x1="63.5" y1="-25.4" x2="68.58" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-10.16" x2="63.5" y2="-25.4" width="0.1524" layer="91"/>
<junction x="63.5" y="-25.4"/>
</segment>
<segment>
<pinref part="ESP8266-01" gate="G$1" pin="GND"/>
<pinref part="V8" gate="G$1" pin="GND"/>
<wire x1="25.4" y1="33.02" x2="25.4" y2="43.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="P$2"/>
<pinref part="C2" gate="G$1" pin="P$2"/>
<wire x1="27.94" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<pinref part="EC2" gate="G$1" pin="P-"/>
<junction x="17.78" y="66.04"/>
<wire x1="17.78" y1="66.04" x2="7.62" y2="66.04" width="0.1524" layer="91"/>
<pinref part="D7" gate="G$1" pin="P+"/>
<wire x1="7.62" y1="66.04" x2="-2.54" y2="66.04" width="0.1524" layer="91"/>
<junction x="7.62" y="66.04"/>
<pinref part="GNDIN" gate="G$1" pin="P$1"/>
<wire x1="-2.54" y1="66.04" x2="-12.7" y2="66.04" width="0.1524" layer="91"/>
<junction x="-2.54" y="66.04"/>
<wire x1="-12.7" y1="66.04" x2="-17.78" y2="66.04" width="0.1524" layer="91"/>
<junction x="-12.7" y="66.04"/>
<pinref part="V3" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="V2" gate="G$1" pin="GND"/>
<wire x1="22.86" y1="-17.78" x2="22.86" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="SWRX-" gate="G$1" pin="P$1"/>
<wire x1="15.24" y1="-12.7" x2="15.24" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="15.24" y1="-15.24" x2="22.86" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="SW12-" gate="G$1" pin="P$1"/>
<wire x1="22.86" y1="-15.24" x2="30.48" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-15.24" x2="30.48" y2="-12.7" width="0.1524" layer="91"/>
<junction x="22.86" y="-15.24"/>
<pinref part="SWRST-" gate="G$1" pin="P$1"/>
<wire x1="22.86" y1="-15.24" x2="22.86" y2="-12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="ESP8266-01" gate="G$1" pin="TX"/>
<pinref part="TXOUT" gate="G$1" pin="P$1"/>
<wire x1="5.08" y1="33.02" x2="5.08" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="1">
<segment>
<pinref part="ACIN" gate="G$1" pin="P$2"/>
<pinref part="ACOUT" gate="G$1" pin="P$1"/>
<wire x1="91.44" y1="25.4" x2="99.06" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="P$1"/>
<pinref part="R6" gate="G$1" pin="P$1"/>
<wire x1="-15.24" y1="22.86" x2="-15.24" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="P$1"/>
<wire x1="-15.24" y1="27.94" x2="-15.24" y2="33.02" width="0.1524" layer="91"/>
<junction x="-15.24" y="27.94"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<wire x1="-15.24" y1="33.02" x2="-15.24" y2="38.1" width="0.1524" layer="91"/>
<junction x="-15.24" y="33.02"/>
<pinref part="R9" gate="G$1" pin="P$1"/>
<wire x1="-15.24" y1="38.1" x2="-15.24" y2="43.18" width="0.1524" layer="91"/>
<junction x="-15.24" y="38.1"/>
<pinref part="V9" gate="G$1" pin="+3V3"/>
<wire x1="-15.24" y1="33.02" x2="-17.78" y2="33.02" width="0.1524" layer="91"/>
<pinref part="ESP8266-01" gate="G$1" pin="VCC"/>
<wire x1="5.08" y1="17.78" x2="5.08" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="5.08" y1="-2.54" x2="-15.24" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-2.54" x2="-15.24" y2="22.86" width="0.1524" layer="91"/>
<junction x="-15.24" y="22.86"/>
</segment>
<segment>
<pinref part="V4" gate="G$1" pin="+3V3"/>
<pinref part="3V3IN" gate="G$1" pin="P$1"/>
<wire x1="-17.78" y1="76.2" x2="-12.7" y2="76.2" width="0.1524" layer="91"/>
<pinref part="EC2" gate="G$1" pin="P+"/>
<pinref part="C2" gate="G$1" pin="P$1"/>
<pinref part="C1" gate="G$1" pin="P$1"/>
<wire x1="7.62" y1="76.2" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
<wire x1="17.78" y1="76.2" x2="27.94" y2="76.2" width="0.1524" layer="91"/>
<junction x="17.78" y="76.2"/>
<pinref part="D7" gate="G$1" pin="P-"/>
<wire x1="7.62" y1="76.2" x2="-2.54" y2="76.2" width="0.1524" layer="91"/>
<junction x="7.62" y="76.2"/>
<wire x1="-12.7" y1="76.2" x2="-2.54" y2="76.2" width="0.1524" layer="91"/>
<junction x="-12.7" y="76.2"/>
<junction x="-2.54" y="76.2"/>
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="E"/>
<pinref part="Q1" gate="G$1" pin="E"/>
<pinref part="V1" gate="G$1" pin="+3V3"/>
<wire x1="71.12" y1="25.4" x2="63.5" y2="25.4" width="0.1524" layer="91"/>
<junction x="63.5" y="25.4"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="ESP8266-01" gate="G$1" pin="CH"/>
<pinref part="R6" gate="G$1" pin="P$2"/>
<wire x1="5.08" y1="27.94" x2="0" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$2"/>
<wire x1="0" y1="33.02" x2="0" y2="28.956" width="0.1524" layer="91"/>
<wire x1="0" y1="28.956" x2="14.732" y2="28.956" width="0.1524" layer="91"/>
<wire x1="14.732" y1="28.956" x2="14.732" y2="19.304" width="0.1524" layer="91"/>
<pinref part="ESP8266-01" gate="G$1" pin="RX"/>
<wire x1="14.732" y1="19.304" x2="25.4" y2="19.304" width="0.1524" layer="91"/>
<wire x1="25.4" y1="19.304" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<pinref part="SWRX+" gate="G$1" pin="P$1"/>
<wire x1="25.4" y1="12.7" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<junction x="25.4" y="17.78"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="25.4" y1="24.384" x2="15.748" y2="24.384" width="0.1524" layer="91"/>
<wire x1="15.748" y1="24.384" x2="15.748" y2="29.972" width="0.1524" layer="91"/>
<wire x1="15.748" y1="29.972" x2="1.016" y2="29.972" width="0.1524" layer="91"/>
<wire x1="1.016" y1="29.972" x2="1.016" y2="38.1" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="P$2"/>
<wire x1="1.016" y1="38.1" x2="0" y2="38.1" width="0.1524" layer="91"/>
<pinref part="ESP8266-01" gate="G$1" pin="IO0"/>
<wire x1="25.4" y1="22.86" x2="25.4" y2="24.384" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="P-"/>
<wire x1="30.48" y1="17.78" x2="27.94" y2="17.78" width="0.1524" layer="91"/>
<wire x1="27.94" y1="17.78" x2="27.94" y2="22.86" width="0.1524" layer="91"/>
<wire x1="27.94" y1="22.86" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<junction x="25.4" y="22.86"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<wire x1="25.4" y1="29.464" x2="16.764" y2="29.464" width="0.1524" layer="91"/>
<wire x1="16.764" y1="29.464" x2="16.764" y2="30.988" width="0.1524" layer="91"/>
<wire x1="16.764" y1="30.988" x2="2.032" y2="30.988" width="0.1524" layer="91"/>
<wire x1="2.032" y1="30.988" x2="2.032" y2="43.18" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="2.032" y1="43.18" x2="0" y2="43.18" width="0.1524" layer="91"/>
<pinref part="ESP8266-01" gate="G$1" pin="IO2"/>
<wire x1="25.4" y1="27.94" x2="25.4" y2="29.464" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="P-"/>
<wire x1="30.48" y1="33.02" x2="27.94" y2="33.02" width="0.1524" layer="91"/>
<wire x1="27.94" y1="33.02" x2="27.94" y2="27.94" width="0.1524" layer="91"/>
<wire x1="27.94" y1="27.94" x2="25.4" y2="27.94" width="0.1524" layer="91"/>
<junction x="25.4" y="27.94"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="EC1" gate="G$1" pin="P+"/>
<wire x1="2.54" y1="15.24" x2="2.54" y2="22.86" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
<pinref part="ESP8266-01" gate="G$1" pin="RST"/>
<wire x1="0" y1="22.86" x2="2.54" y2="22.86" width="0.1524" layer="91"/>
<wire x1="2.54" y1="22.86" x2="5.08" y2="22.86" width="0.1524" layer="91"/>
<junction x="2.54" y="22.86"/>
<pinref part="SWRST+" gate="G$1" pin="P$1"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="15.24" width="0.1524" layer="91"/>
<junction x="2.54" y="15.24"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="P-"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
<wire x1="48.26" y1="-7.62" x2="48.26" y2="-10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P-"/>
<pinref part="R3" gate="G$1" pin="P$1"/>
<wire x1="48.26" y1="58.42" x2="48.26" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="D5" gate="G$1" pin="P+"/>
<wire x1="63.5" y1="48.26" x2="58.42" y2="48.26" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="P+"/>
<wire x1="58.42" y1="48.26" x2="48.26" y2="48.26" width="0.1524" layer="91"/>
<junction x="58.42" y="48.26"/>
<pinref part="RLY1" gate="G$1" pin="P$1"/>
<wire x1="63.5" y1="55.88" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="C"/>
<wire x1="63.5" y1="40.64" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<junction x="63.5" y="48.26"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="D5" gate="G$1" pin="P-"/>
<pinref part="D3" gate="G$1" pin="P-"/>
<wire x1="58.42" y1="58.42" x2="58.42" y2="66.04" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="D6" gate="G$1" pin="P+"/>
<wire x1="63.5" y1="2.54" x2="58.42" y2="2.54" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P+"/>
<wire x1="58.42" y1="2.54" x2="48.26" y2="2.54" width="0.1524" layer="91"/>
<junction x="58.42" y="2.54"/>
<pinref part="RLY2" gate="G$1" pin="P$1"/>
<wire x1="63.5" y1="-5.08" x2="63.5" y2="2.54" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="C"/>
<wire x1="63.5" y1="10.16" x2="63.5" y2="2.54" width="0.1524" layer="91"/>
<junction x="63.5" y="2.54"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="D6" gate="G$1" pin="P-"/>
<pinref part="D4" gate="G$1" pin="P-"/>
<wire x1="58.42" y1="-7.62" x2="58.42" y2="-15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="P$2"/>
<pinref part="Q1" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="P$2"/>
<pinref part="Q2" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="P+"/>
<pinref part="R1" gate="G$1" pin="P$1"/>
<pinref part="SW1+" gate="G$1" pin="P$1"/>
<wire x1="40.64" y1="33.02" x2="40.64" y2="40.64" width="0.1524" layer="91"/>
<junction x="40.64" y="33.02"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="D2" gate="G$1" pin="P+"/>
<pinref part="R2" gate="G$1" pin="P$1"/>
<pinref part="SW2+" gate="G$1" pin="P$1"/>
<wire x1="40.64" y1="10.16" x2="40.64" y2="17.78" width="0.1524" layer="91"/>
<junction x="40.64" y="17.78"/>
</segment>
</net>
<net name="N$20" class="1">
<segment>
<pinref part="RLY2" gate="G$1" pin="COM"/>
<wire x1="81.28" y1="-7.62" x2="83.82" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="83.82" y1="-7.62" x2="83.82" y2="25.4" width="0.1524" layer="91"/>
<pinref part="RLY1" gate="G$1" pin="COM"/>
<wire x1="83.82" y1="25.4" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
<wire x1="83.82" y1="58.42" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<pinref part="ACIN" gate="G$1" pin="P$1"/>
<wire x1="88.9" y1="25.4" x2="83.82" y2="25.4" width="0.1524" layer="91"/>
<junction x="83.82" y="25.4"/>
</segment>
</net>
<net name="N$15" class="1">
<segment>
<pinref part="ACOUT" gate="G$1" pin="P$2"/>
<pinref part="RLY1" gate="G$1" pin="NO"/>
<wire x1="101.6" y1="25.4" x2="101.6" y2="60.96" width="0.1524" layer="91"/>
<wire x1="101.6" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="1">
<segment>
<pinref part="RLY2" gate="G$1" pin="NO"/>
<pinref part="ACOUT" gate="G$1" pin="P$3"/>
<wire x1="81.28" y1="-10.16" x2="104.14" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="104.14" y1="-10.16" x2="104.14" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
