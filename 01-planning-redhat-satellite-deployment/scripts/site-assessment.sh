#!/bin/bash

echo "SATELLITE CAPSULE SITE ASSESSMENT"
echo "================================="

create_assessment() {
    local site_name=$1
    
    cat > "assessment-${site_name}.txt" << ASSESSMENT_EOF
SITE ASSESSMENT: ${site_name}
============================

BASIC INFORMATION:
Site Name: ${site_name}
Location: [Enter location]
Contact Person: [Enter contact]
Assessment Date: $(date)

INFRASTRUCTURE ASSESSMENT:
Number of managed hosts: [Enter count]
Operating Systems in use: [List OS versions]
Current patch management: [Describe current process]
Network bandwidth to main site: [Enter bandwidth]
Local IT staff availability: [Yes/No and skill level]

TECHNICAL REQUIREMENTS:
□ Content synchronization needed
□ Local provisioning required
□ DHCP service needed
□ DNS service needed
□ Isolated network segments
□ Compliance requirements
□ Backup/DR considerations

RECOMMENDED CAPSULE CONFIGURATION:
Based on assessment, recommend:
- Capsule Server: [Yes/No]
- Hardware specifications: [List specs]
- Services to enable: [List services]
- Implementation timeline: [Provide timeline]

NOTES:
[Additional considerations and notes]
ASSESSMENT_EOF

    echo "Assessment template created: assessment-${site_name}.txt"
}

echo "Enter site name for assessment:"
read SITE_NAME

if [ -n "$SITE_NAME" ]; then
    create_assessment "$SITE_NAME"
else
    echo "Please provide a site name"
fi
