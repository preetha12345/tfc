def extractVersion(versionString) {
    // Updated regex pattern to handle different formats
    def regex = ~/jdk(?:-(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?(?:_(u(\d+)))?/

    // Match the version string against the regex
    def matcher = versionString =~ regex
    if (matcher) {
        matcher.each { match ->
            def major = match[1] ?: ''
            def minor = match[2] ?: ''
            def patch = match[3] ?: ''
            def build = match[4] ?: ''

            // Format the version string
            def version = "${major}.${minor}${minor ? '.' : ''}${patch}${build ? 'u' + build : ''}"
            return version
        }
    } else {
        return "No version found"
    }
}

// Example usage
def versionString = "D:\\Apps\\Java\\jdk11.0"  // Replace with the actual input
def version = extractVersion(versionString)
println "Version: ${version}"
