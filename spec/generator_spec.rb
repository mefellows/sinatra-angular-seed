require 'rspec'
require 'placeholder/commands/placeholder'
require 'placeholder/filters/filters'
require 'spec_helper'

describe PlaceholderGenerator do
  url = URI::parse('http://foo.com/foo/bar')

  it 'Should return an index from a single page' do
    generator = PlaceholderGenerator.new
    filters = Filters::Util.get_all_filters
    transformers = Transformers::Util.get_all_transformers

    # Note no trailing slash -> need to find why lack of trailing slash is an issue
    link = URI::parse("http://www.onegeek.com.au")
    index = generator.create_index(link, link, filters, transformers, nil, 1)

    puts "Here's the index:"
    index.each do |key, value|
      puts key
    end

    expect(index.length).to be 18
  end


  # Should not index an XML document


  # should follow redirects to the same domain


  # should treat trailing slashes the same as without???


  # Test for blacklisted URIs


  # Should not index files (PDFs, images etc.)
  it 'Should not index static files (PDFs, images etc.)' do
    # generator = PlaceholderGenerator.new

  end

  # it 'Should return an index from an entire site' do
  #   generator = PlaceholderGenerator.new

  #   # onegeek.com.au source as at 23/05/2014
  #   doc = Nokogiri::HTML('<!DOCTYPE HTML> <html lang="en"> <head> <meta charset="utf-8"> <!--[if lte IE 8]> <script src="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/js/ie-html5.js" type="text/javascript"></script> <![endif]--> <!--[if lt IE 9]> <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script> <![endif]--> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>Usability, Web Standards &amp; Design | Matthew Fellows</title> <script type="text/javascript"> //<![CDATA[try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:0,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok9v=e9cb4febb4/"},atok:"8407449c08a29cd8a6c8a3bd5f55d64f",petok:"c98ca1db99b9a96d907e5221878e535c8620bc66-1400845495-1800",zone:"onegeek.com.au",rocket:"a",apps:{}}];document.write( <script type="text/javascript" src="//ajax.cloudflare.com/cdn-cgi/nexp/dok9v=97fb4d042e/cloudflare.min.js"><\'+\'\/script>\');}}catch(e){}; //]]> </script> <link rel="stylesheet" href="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/css/blueprint.css" type="text/css" media="screen"/> <link rel="stylesheet" href="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/css/style.css" type="text/css" media="screen"/> <link rel="pingback" href="http://www.onegeek.com.au/xmlrpc.php"/> <link rel="alternate" type="application/rss+xml" title="OneGeek | Usability, Web Standards and Design (RSS 2.0)" href="/feed/"/> <link rel="alternate" type="text/xml" title="OneGeek | Usability, Web Standards and Design (RSS .92)" href="/feed/rss/"/> <link rel="alternate" type="application/atom+xml" title="OneGeek | Usability, Web Standards and Design (ATOM .30)" href="/feed/atom/"/> <link rel="profile" href="http://microformats.org/profile/hcard"/> <link rel="profile" href="http://gmpg.org/xfn/11"/> <link rel="stylesheet" id="wpt-twitter-feed-css" href="http://d2pk187t5c7952.cloudfront.net/wp-content/plugins/wp-to-twitter/css/twitter-feed.css?ver=3.5.2" type="text/css" media="all"/> <link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.onegeek.com.au/xmlrpc.php?rsd"/> <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://d2pk187t5c7952.cloudfront.net/wp-includes/wlwmanifest.xml"/> <meta name="keywords" content="Matthew Fellows, OneGeek, usability, web standards, articles, HCI, programming, javascript, php, java"/> <link rel="canonical" href="http://www.onegeek.com.au/"/> <!--[if IE]><script src="http://d2pk187t5c7952.cloudfront.net/wp-content/plugins/wp-gbcf/wp-gbcf_focus.js" type="text/javascript"></script><![endif]--><meta id="syntaxhighlighteranchor" name="syntaxhighlighter-version" content="3.1.1"/> </head> <body class="home blog"> <div class="container"> <div id="page" class="span-24"> <header id="header"> <div id="logo" class="span-11"> <a href="/" class="url"><img class="logo" src="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/images/logo.gif" alt="Matthew Fellows - OneGeek" title="Matthew Fellows - OneGeek "/></a> <div id="logo_text"> <h4 class="fn nickname">OneGeek</h4> <p>Web, Standards <em>&amp;</em> Usability</p> </div> </div> <nav id="menu" class="span-12 prepend-1 last"> <ul> <li class="current"> <a href="#">Menu</a> </li> <li><a href="/category/articles/">Articles</a> <ul> <li>Ramblings on the Web and stuff</li> </ul> </li> <li><a href="/projects/">Projects</a> <ul> <li>My attempt to give back to the community</li> </ul> </li> <li><a href="/journal/">Journal</a> <ul> <li>Personal blog posts</li> </ul> </li> <li class="last-child"><a href="/about/">About</a> <ul> <li>Who is this guy anyway?</li> </ul> </li> </ul> </nav> </header> <div id="content" class="narrowcolumn"> <div class="blurb vcard"> <h1><span class="fn name">Matthew Fellows</span> &mdash; <span class="title">Professional Web Developer</span></h1> <p>I\'m a University trained <span class="degree">Cognitive \ Computer Scientist</span> living in <span class="adr"><span class="locality">Melbourne</span></span> who enjoys building products on the <strong>web</strong> with a focus on <strong>usability</strong>, <strong>web standards</strong> and <strong>business outcomes</strong>.</p> <p class="read-more">See what makes me <a href="/about">tick</a> and what I\'m currently <a href="/about#where">doing</a> at <span class="org"><span class="organization-name">Melbourne IT</span></span>, tweet my <a href="/category/articles/">articles</a> or use my open-source <a href="/category/projects">software</a>.</p> </div> <div class="span-8" id="projects"> <div class="sidebar_item"><h4>Recent Posts</h4><ul> <li> <a href="http://www.onegeek.com.au/blog/570" title="Taking back content">Taking back content</a> </li> <li> <a href="http://www.onegeek.com.au/journal/scrum-my-life" title="Scrum my life">Scrum my life</a> </li> <li> <a href="http://www.onegeek.com.au/articles/2014-thoughtworks-tech-radar" title="2014 Thoughtworks Tech Radar">2014 Thoughtworks Tech Radar</a> </li> <li> <a href="http://www.onegeek.com.au/articles/development-articles/load-time-weaving-in-fuse-esb-equinox-aspect" title="Load Time Weaving in Fuse ESB (Apache ServiceMix) with Equinox Aspects">Load Time Weaving in Fuse ESB (Apache ServiceMix) with Equinox Aspects</a> </li> <li> <a href="http://www.onegeek.com.au/rest-api/polymorphic-payloads-in-restful-api-using-apache-cxfjax-rs" title="Polymorphic Payloads in RESTful API using Apache CXF/JAX-RS">Polymorphic Payloads in RESTful API using Apache CXF/JAX-RS</a> </li> <script type="text/rocketscript"> // <![CDATA[var disqus_shortname = \'onegeek\'; (function () {var nodes = document.getElementsByTagName(\'span\'); for (var i = 0, url; i < nodes.length; i++) {if (nodes[i].className.indexOf(\'dsq-postid\') != -1) {nodes[i].parentNode.setAttribute(\'data-disqus-identifier\', nodes[i].getAttribute(\'rel\')); url = nodes[i].parentNode.href.split(\'#\', 1); if (url.length == 1) { url = url[0]; } else { url = url[1]; } nodes[i].parentNode.href = url + \'#disqus_thread\'; } } var s = document.createElement(\'script\'); s.async = true; s.type = \'text/javascript\'; s.src = \'//\' + \'disqus.com/forums/\' + disqus_shortname + \'/count.js\'; (document.getElementsByTagName(\'HEAD\')[0] || document.getElementsByTagName(\'BODY\')[0]).appendChild(s); }()); //]]> </script> </ul> </div> </div> <div class="span-8" id="latest"> <div class="sidebar_item"><h2><a href="http://twitter.com/matthewfellows">In a Twitter</a></h2><p>Error: Twitter did not respond. Please wait a few minutes and refresh this page.</p></div> </div> <div class="span-8 last search"> <h2>Search OneGeek</h2> <form method="get" id="searchform" action="/"> <div><label class="screen-reader-text hidden" for="s">Search</label> <input type="text" value="" name="s" id="s"/> <input type="submit" id="searchsubmit" value="Search"/></div> </form> </div> </div> </div> </div> <footer id="footer"> <div class="container"> <div class="span-8"> <h4>Downloads</h4> <h5>Contributions to the Community</h5> <h5>GSuite products</h5> <ul> <li><a href="/javascript-form-validation">GValidator</a></li> <li><a href="/javascript-serializer">GSerializer</a></li> <li class="new"><a href="/javascript-form-state-recovery">GRememberMe</a></li> </ul> </div> <div class="span-8"> <h4>Under the Hood</h4> <h5>The house that Standards built</h5> <h5>Standards</h5> <ul> <li><a href="http://www.w3c.org">HTML 5</a></li> <li><a href="http://www.w3c.org">CSS 3.0</a></li> <li><a href="http://www.microformats.org">Microformats</a></li> </ul> <h5>Frameworks &amp; Platforms</h5> <ul> <li><a href="http://www.mootools.net/">Mootools</a></li> <li><a href="http://www.wordpress.org">Wordpress</a></li> <li><a href="http://www.blueprintcss.com">Blueprint CSS</a></li> <li><a href="http://www.php.net">PHP</a></li> </ul> </div> <div class="span-8 last"> <h4>Get in touch</h4> <h5>8 ways to stalk me</h5> <ul> <li class="gicon web"><a href="/contact">Contact</a> me on <a class="url fn org" href="http://www.onegeek.com.au">OneGeek</a></li> <li class="gicon iconemail">Get my <a href="http://h2vx.com/vcf/http://development.onegeek.com.au/contact/">vcard</a> or <a class="email" href="http://www.cloudflare.com/email-protection#f69b978282d890939a9a998185b69998939193939dd895999bd89783">Email</a> me</li> <li class="gicon twitter"><a class="fn url" href="http://www.twitter.com/matthewfellows">Follow</a> me on Twitter</li> <li class="gicon linkedin">View my LinkedIn <a class="fn url" href="http://au.linkedin.com/pub/matt-fellows/4/153/656">profile</a></li> <li class="gicon flickr"><a class="url" href="http://www.flickr.com/photos/mattfellows">Spy</a> on me at Flickr</li> <li class="gicon delicious">Steal my Delicous <a class="url" href="http://www.delicious.com/mefellows">links</a></li> <li class="gicon rss">Subscribe to the OneGeek <a href="/feed">RSS Feed</a></li> </ul> </div> </div> </footer> <script type="text/rocketscript" data-rocketsrc="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/js/mootools-1.3.js"></script> <script type="text/rocketscript" data-rocketsrc="http://d2pk187t5c7952.cloudfront.net/wp-content/themes/onegeek/js/home.js"></script> <script type="text/rocketscript"> var _gaq = _gaq || []; _gaq.push([\'_setAccount\', \'UA-1274481-1\']); _gaq.push([\'_trackPageview\']); (function() {var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true; ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\'; var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s); })(); </script> <script type="text/javascript"> /* <![CDATA[ */ (function(){try{var s,a,i,j,r,c,l=document.getElementsByTagName("a"),t=document.createElement("textarea");for(i=0;l.length-i;i++){try{a=l[i].getAttribute("href");if(a&&"www.cloudflare.com/email-protection"==a.substr(7 ,35)){s=\'\';j=43;r=parseInt(a.substr(j,2),16);for(j+=2;a.length-j&&a.substr(j,1)!=\'X\';j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}j+=1;s+=a.substr(j,a.length-j);t.innerHTML=s.replace(/</g,"&lt;").replace(/>/g,"&gt;");l[i].setAttribute("href","mailto:"+t.value);}}catch(e){}}}catch(e){}})(); /* ]]> */ </script> </body> </html>')
  #   index = generator.create_index(URI::parse("http://www.onegeek.com.au"), URI::parse("http://www.onegeek.com.au"), [], nil, 1)

  #   index.each do |key, value|
  #     puts key
  #   end
  # end

end