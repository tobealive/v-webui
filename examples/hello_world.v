// v install https://github.com/malisipi/vwebui
import malisipi.vwebui as webui

fn check_the_password(e &webui.Event) { // Check the password function
    password := e.window.script("return document.getElementById(\"MyInput\").value;", 0, 4096)
    println("Password: "+password)
    
    if password == "123456" { // Check the password
        e.window.script("alert('Good. Password is correct.');", 0, 0) // Correct password
    } else {
        e.window.script("alert('Sorry. Wrong password.');", 0, 0) // Wrong password
    }
}

fn close_the_application(e &webui.Event) { // Close all opened windows
    webui.exit()
}

mut my_window := webui.new_window() // Create a window

// UI HTML
my_html := ('
    <!DOCTYPE html>
    <html><head><title>WebUI 2 - V Example</title>
    <style>body{color: white; background: #0F2027;
    background: -webkit-linear-gradient(to right, #2C5364, #203A43, #0F2027);
    background: linear-gradient(to right, #2C5364, #203A43, #0F2027);
    text-align:center; font-size: 18px; font-family: sans-serif;}</style></head><body>
    <h1>WebUI 2 - V Example</h1><br>
    <input type=\"password\" id=\"MyInput\"><br><br>
    <button id=\"MyButton1\">Check Password</button> - <button id=\"MyButton2\">Exit</button>
    </body></html>
')

// Bind HTML elements with functions
my_window.bind("MyButton1", check_the_password)
my_window.bind("MyButton2", close_the_application)

// Show the window
if !my_window.show(my_html) { // Run the window
    panic("The browser(s) was failed") // If not, print a error info
}

// Wait until all windows get closed
webui.wait()