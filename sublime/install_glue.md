## How to install Glue for Sublime

1.The simplest method of installation is through the Sublime Text console. 
The console is accessed via the `ctrl+`` shortcut or the View > Show Console menu. 

2.Paste the following python code:

```import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)```

This code creates the Installed Packages folder for you (if necessary), 
and then downloads the Package Control.sublime-package into it. 
The download will be done over HTTP instead of HTTPS due to Python standard library limitations,
however the file will be validated using SHA-256.
