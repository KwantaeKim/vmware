# -------------------------------
# 1) Set Windows Language to English
# -------------------------------
# Set preferred language and input method for United States - International
$languageTag = "en-US"                    # Replace with your preferred language tag, e.g., "en-GB" for British English
$inputMethod = "0409:00020409"             # 0409:00020409 for United States - International keyboard
$removeInputMethod = "040B:0000040B"       # 040B:0000040B for Finnish QWERTY keyboard

# Set up the United States - International keyboard layout
$languageList = New-WinUserLanguageList -Language $languageTag
$languageList[0].InputMethodTips.Add($inputMethod)

# Apply the updated language list and input method, replacing existing ones
Set-WinUserLanguageList -LanguageList $languageList -Force
Set-WinUILanguageOverride -Language $languageTag

# Remove Finnish QWERTY if it's present
$languageList = Get-WinUserLanguageList
foreach ($language in $languageList) {
    if ($language.InputMethodTips -contains $removeInputMethod) {
        $language.InputMethodTips.Remove($removeInputMethod)
    }
}

# Apply final language list without Finnish QWERTY
Set-WinUserLanguageList -LanguageList $languageList -Force

Write-Output "Keyboard layout has been changed to United States - International, and Finnish QWERTY has been removed."

# -----------------------------------------
# 2) Force Windows Decimal Separator to "."
# -----------------------------------------
# This modifies your user’s Region settings in the registry.
# Sign out and sign back in to ensure changes propagate everywhere.
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sDecimal" -Value "."
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sThousand" -Value ","

Write-Output "Decimal separator changed to '.' and Thousand separator changed to ','."