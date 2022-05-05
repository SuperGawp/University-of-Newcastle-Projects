<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> <!--Created by Aryan Chandra (C3360071). File Name: template-xslt.xml Created on: 24/10/2020-->
<xsl:output method="html"/>

	<xsl:template match="Holiday">
		<html>
		<head>

			<link rel="stylesheet" href="style.css" type="text/css" />
			<title>goHoliday</title>
			<style type="text/css">
			</style>

		</head>
			<body>
				<div style="border: 3px outset pink;">
					<h1>Holidays</h1> 
				</div> <br/>

				<div style="border: 3px outset pink;">
					<u><h2 style="color: black; font-size: 30px; text-align: center"><xsl:value-of select="./@category" /><xsl:text> Packages</xsl:text></h2></u>
				</div> <br/>

				<xsl:apply-templates select="pack">
					<xsl:sort select="packName"/>
				</xsl:apply-templates>

				<address id="copyright">
					Aryan Chandra <br/>
					c3360071@uon.edu.au <br/>
					SENG1050 - Assignment 2 <br/>
				</address>

				<xsl:apply-templates select="review"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="pack">
		<div style="border: 3px outset pink;">
			<p style="font-style:italic">
				<h2>
					<xsl:value-of select="packName"/>
					<xsl:text> - </xsl:text> 
					<xsl:value-of select="cost"/>
					<xsl:text> (</xsl:text> 
					<xsl:value-of select="popularity"/>
					<xsl:text>✰)</xsl:text> 
				</h2>
				
				<b><xsl:value-of select="packAvail"/></b>
				<xsl:text> - </xsl:text>

				<xsl:text>Number of Nights: </xsl:text>
				<xsl:value-of select="noOfNights"/>
				<br/>
			</p>

			<div>
				<xsl:if test='picURL!=""'>
					<img width="400" height="250" alt="Holiday Photo">
						<xsl:attribute name="src">
							<xsl:value-of select="picURL"/>
						</xsl:attribute>
					</img>
				</xsl:if>

				<p>
					<xsl:value-of select="desc"/>
					<xsl:text> </xsl:text> <br/>
				</p> <br/> <br/>

				<div>
					<p class="rev">
						<b><u>Review:</u></b> <br/>
						<xsl:value-of select="review/reviewName"/> <br/>
						<xsl:value-of select="review/reviewD"/> <br/>	
						<xsl:text>- </xsl:text><xsl:value-of select="review/reviewRating"/>
					</p>
				</div>
			</div>


			<xsl:choose>
				<xsl:when test='couponCode!=""'>
					<b><xsl:text>Coupon Code: </xsl:text></b>
					<xsl:value-of select="couponCode" />
				</xsl:when>
			
				<xsl:otherwise>
					<b><xsl:text>Coupon Code: </xsl:text></b> <xsl:text>Unavilable</xsl:text>
				</xsl:otherwise>
			</xsl:choose>

			<p>
				<xsl:value-of select="accomo"/>
				<xsl:text> (Available from: </xsl:text>
				<xsl:value-of select="datesAvail"/>
				<xsl:text>)</xsl:text>
			</p>

			<xsl:choose>
				<xsl:when test='holidayWeb!=""'>
					<a href='{holidayWeb}'><xsl:value-of select="holidayWeb" /></a>
				</xsl:when>
			
				<xsl:otherwise>
					<xsl:text>URL of package Unavailable</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</div> <br/>
	</xsl:template>
</xsl:stylesheet>