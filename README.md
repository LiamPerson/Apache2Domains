# Apache2Domains
Bash scripts to quickly add and remove domains in an apache2 environment on Debian.

Creates website directory in <code>/var/www</code> writes config, enables site, and optionally adds <code>index.html</code> file.

<img src="https://raw.githubusercontent.com/YeloPartyHat/Apache2Domains/main/screenshot.png" alt="Screenshot of the bash script.">

# Usage
<ol>
  <li>Put files onto target machine. e.g: <code>wget https://raw.githubusercontent.com/YeloPartyHat/Apache2Domains/main/newdomain.sh && wget https://raw.githubusercontent.com/YeloPartyHat/Apache2Domains/main/removedomain.sh</code></li>
  <li>Navigate to the location you put the files using <code>cd</code></li>
  <li>Run files using <code>sudo bash file.sh</code> e.g: <code>sudo bash newdomain.sh</code></li>
  <li>Follow in-console prompts</li>
</ol>

# Requirements
These scripts rely on apache2 to work and must be executed using the super user (sudo).
```sh
sudo apt install apache2
```

# Notes
<ul>
  <li>You may notice you can't immediately run the file when you place it. This is because you don't have the adequate permissions. To fix this, use: <code>chmod +x file.sh</code></li>
</ul>

<hr>

<i>Use with caution! <br>I am not responsible if you accidentally register the wrong domain or remove something important!</i>
