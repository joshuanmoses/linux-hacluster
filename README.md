<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>

<h1>🖥️ Linux High-Availability Cluster Automation</h1>

<blockquote>
  <em>A Bash script to automate the setup of a high-availability (HA) cluster on Linux systems using Pacemaker and Corosync.</em>
</blockquote>

<hr>

<h2>🚀 Features</h2>

<ul>
  <li>Automated installation and configuration of HA cluster components</li>
  <li>Support for Pacemaker and Corosync setup</li>
  <li>Streamlined process for initializing cluster nodes</li>
  <li>Designed for Red Hat-based distributions (e.g., CentOS, RHEL)</li>
</ul>

<hr>

<h2>📂 Repository Structure</h2>

<pre><code>
linux-hacluster/
├── hacluster.sh       # Main script to set up the HA cluster
├── README.html        # Project documentation in HTML format
├── LICENSE            # Licensing information
</code></pre>

<hr>

<h2>🔧 Prerequisites</h2>

<ul>
  <li>Linux system (CentOS/RHEL 7 or higher recommended)</li>
  <li>Root or sudo privileges</li>
  <li>Internet connectivity for package installation</li>
</ul>

<hr>

<h2>⚙️ Installation & Usage</h2>

<ol>
  <li>Clone the repository:
    <pre><code>git clone https://github.com/joshuanmoses/linux-hacluster.git</code></pre>
  </li>
  <li>Navigate to the project directory:
    <pre><code>cd linux-hacluster</code></pre>
  </li>
  <li>Make the script executable:
    <pre><code>chmod +x hacluster.sh</code></pre>
  </li>
  <li>Run the script with root privileges:
    <pre><code>sudo ./hacluster.sh</code></pre>
  </li>
</ol>

<p><strong>Note:</strong> Ensure that all nodes intended for the cluster have network connectivity and proper hostname resolution.</p>

<hr>


<h2>🤝 Contributing</h2>

<p>Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.</p>


</body>
</html>
