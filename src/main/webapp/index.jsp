<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ansible Infrastructure Management Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }
        
        .header h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }
        
        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }
        
        .card h3 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 1.4rem;
        }
        
        .status {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        
        .status-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .status-active {
            background-color: #4CAF50;
        }
        
        .status-inactive {
            background-color: #f44336;
        }
        
        .ansible-info {
            background: linear-gradient(135deg, #ff6b6b, #ee5a6f);
            color: white;
            text-align: center;
        }
        
        .deployment-info {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }
        
        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .feature-list {
            list-style: none;
            padding: 0;
        }
        
        .feature-list li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        
        .feature-list li:before {
            content: "✓";
            color: #4CAF50;
            font-weight: bold;
            margin-right: 10px;
        }
        
        .footer {
            text-align: center;
            color: white;
            opacity: 0.8;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🚀 Ansible Infrastructure Dashboard</h1>
            <p>Automated Deployment & Configuration Management System</p>
        </div>
        
        <div class="dashboard">
            <div class="card">
                <h3>📊 System Status</h3>
                <div class="status">
                    <div class="status-indicator status-active"></div>
                    <span>Jenkins Pipeline: Active</span>
                </div>
                <div class="status">
                    <div class="status-indicator status-active"></div>
                    <span>Tomcat Server: Running</span>
                </div>
                <div class="status">
                    <div class="status-indicator status-active"></div>
                    <span>Ansible Deployment: Success</span>
                </div>
                <div class="status">
                    <div class="status-indicator status-active"></div>
                    <span>Application Health: Good</span>
                </div>
            </div>
            
            <div class="card">
                <h3>🔧 Ansible Features</h3>
                <ul class="feature-list">
                    <li>Automated WAR Deployment</li>
                    <li>Tomcat Configuration Management</li>
                    <li>CI/CD Pipeline Integration</li>
                    <li>Infrastructure as Code</li>
                    <li>Multi-Environment Support</li>
                    <li>Idempotent Operations</li>
                </ul>
            </div>
            
            <div class="card ansible-info">
                <h3>🎯 Deployment Info</h3>
                <p><strong>Application:</strong> MavenAnsibleWebApp</p>
                <p><strong>Version:</strong> 1.0-SNAPSHOT</p>
                <p><strong>Deployed:</strong> <%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %></p>
                <p><strong>Environment:</strong> <%= System.getProperty("java.version") %></p>
            </div>
            
            <div class="card">
                <h3>📈 Project Architecture</h3>
                <div class="deployment-info">
                    <strong>CI/CD Pipeline:</strong><br>
                    GitHub → Jenkins → Maven Build → Ansible Deployment → Tomcat
                </div>
                <p><strong>Technologies Used:</strong></p>
                <ul class="feature-list">
                    <li>Jenkins for CI/CD</li>
                    <li>Maven for Build Management</li>
                    <li>Ansible for Deployment</li>
                    <li>Tomcat as Web Server</li>
                </ul>
            </div>
            
            <div class="card">
                <h3>🛠️ Management Actions</h3>
                <a href="#" class="btn" onclick="alert('Restart initiated via Ansible!')">Restart Services</a>
                <a href="#" class="btn" onclick="alert('Health check completed!')">Health Check</a>
                <a href="#" class="btn" onclick="alert('Logs retrieved successfully!')">View Logs</a>
                <a href="#" class="btn" onclick="alert('Deployment status: Active')">Deployment Status</a>
            </div>
            
            <div class="card">
                <h3>📋 Recent Activities</h3>
                <div class="deployment-info">
                    <p>✅ <strong><%= new SimpleDateFormat("HH:mm").format(new Date()) %></strong> - Application deployed successfully</p>
                    <p>🔄 <strong><%= new SimpleDateFormat("HH:mm").format(new Date(System.currentTimeMillis() - 300000)) %></strong> - Tomcat service restarted</p>
                    <p>📦 <strong><%= new SimpleDateFormat("HH:mm").format(new Date(System.currentTimeMillis() - 600000)) %></strong> - WAR file updated</p>
                    <p>🚀 <strong><%= new SimpleDateFormat("HH:mm").format(new Date(System.currentTimeMillis() - 900000)) %></strong> - Jenkins build completed</p>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>Powered by Ansible Automation | Deployed via Jenkins CI/CD Pipeline</p>
            <p>© 2024 Infrastructure Automation Dashboard</p>
        </div>
    </div>
</body>
</html>
