<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" 
                doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Book Buddy</title>
                <link rel="icon" href="./assets/bookshare images.webp"/>
                
                <!-- Google Fonts -->
                <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&amp;family=Poppins:wght@300;400;500;600;700&amp;family=Lobster+Two:ital,wght@0,400;0,700;1,400&amp;family=Merriweather:ital,wght@0,300;0,400;0,700;1,300&amp;family=Montserrat:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>

                <!-- Font Awesome -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

                <style>
                    /* All your existing CSS styles go here */
                    /* ... (copy all the CSS from your original file) ... */
                </style>
            </head>
            <body>
                <header>
                    <nav class="navbar">
                        <div class="nav-container">
                            <div class="logo">
                                <img src="./assets/bookshare images.webp" alt="Book Buddy Logo"/>
                                <span class="logo-text">Book Buddy</span>
                            </div>
                            <div class="nav-links">
                                <a href="Home_page.html" class="active"><i class="fas fa-home"></i> Home</a>
                                <a href="Register_BookBuddy.html"><i class="fas fa-user-plus"></i> Register</a>
                                <a href="BookList.html"><i class="fas fa-book-open"></i> Genres</a>
                                <a href="premium.html"><i class="fas fa-crown"></i> Premium</a>
                                <a href="TopBooks.html"><i class="fas fa-star"></i> Top Books</a>
                                <a href="Random_no.html"><i class="fas fa-id-card"></i> Get ID</a>
                                <a href="Login.html"><i class="fas fa-sign-in-alt"></i> Login</a>
                            </div>
                        </div>
                    </nav>
                </header>

                <!-- Hero Slider -->
                <div class="slider-container">
                    <div class="slider">
                        <xsl:for-each select="bookbuddy/slider/slide">
                            <div class="slider-item">
                                <img src="{image}" alt="{title}"/>
                                <div class="slider-overlay">
                                    <h2><xsl:value-of select="title"/></h2>
                                    <p><xsl:value-of select="description" disable-output-escaping="yes"/></p>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <div class="marquee-container">
                        <marquee direction="right" scrollamount="6">
                            <span><xsl:value-of select="bookbuddy/content/marquee"/></span>
                        </marquee>
                    </div>

                    <xsl:for-each select="bookbuddy/content/sections/section">
                        <xsl:choose>
                            <xsl:when test="position() = 1">
                                <h2 class="section-title"><xsl:value-of select="title"/></h2>
                                <h3><xsl:value-of select="subtitle"/></h3>
                                <p class="text-center"><xsl:value-of select="text"/></p>
                            </xsl:when>
                            <xsl:otherwise>
                                <h1 class="section-title"><xsl:value-of select="title"/></h1>
                                <div class="{@type}">
                                    <ul class="feature-list">
                                        <xsl:for-each select="items/item">
                                            <li><xsl:value-of select="." disable-output-escaping="yes"/></li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                    <h2 class="section-title">Join the Book Buddy Community Today!</h2>
                    <div class="cta-container">
                        <a href="Register_BookBuddy.html" class="cta-button">
                            <i class="fas fa-user-plus"></i> Register Now
                        </a>
                        <a href="Login.html" class="cta-button">
                            <i class="fas fa-sign-in-alt"></i> Existing User? Login
                        </a>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>