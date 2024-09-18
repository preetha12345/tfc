
def processedMap = branchStage.collectEntries { branch, settings -> [branch, settings.collectEntries { k, v -> [k, (v == '1' || v.equalsIgnoreCase('yes'))] }] } }




// Define parameters
def clientoolname = "sonar"
def Sonarclinet = "client"

// Function to determine the default value based on the OS
def getDefaultValue() {
    // Check if either parameter has a value
    if (clientoolname?.trim() || Sonarclinet?.trim()) {
        // Check the OS
        def os = System.getProperty("os.name").toLowerCase()
        if (os.contains("win")) {
            return "windows_sonar_default"
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) {
            return "linux_sonar_default"
        } else {
            return "unknown_os_default"
        }
    } else {
        return "no_param_default"
    }
}

// Print the result
println getDefaultValue()
