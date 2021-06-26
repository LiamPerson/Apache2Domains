# Apache2Domains
Bash scripts to quickly add and remove domains in an apache2 environment on Debian.

# Usage
<ol>
  <li>Drag and drop files anywhere onto target machine.</li>
  <li>Navigate to the location you placed the files using <code>cd</code></li>
  <li>Run files using <code>sudo ./file.sh</code> e.g: <code>sudo ./newdomain.sh</code></li>
  <li>Follow in-console prompts</li>
</ol>

# Requirements
These scripts rely on apache2 to work and must be executed using the super user (sudo).
```sh
sudo apt install apache2
```

<i>Use with caution! <br>I am not responsible if you accidentally register the wrong domain or remove something important!</i>
