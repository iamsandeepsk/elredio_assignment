class AppStrings {
  ///
  static String json = """{
  "screens": [
    {
      "screen_name": "name",
      "heading": "A few personal details please 🙂",
      "question": "My name is",
      "hint_text": "Enter your Name",
      "fields": "textfield",
      "options": null,
      "ans": "null"
    },
    {
      "screen_name": "gender",
      "heading": "A few personal details please 🙂",
      "question": "I am a",
      "fields": "radio",
      "options": [
        {
          "text": "Male",
          "value": "male"
        },
        {
          "text": "Female",
          "value": "female"
        }
      ],
      "ans": null
    },
    {
      "screen_name": "dob",
      "heading": "A few personal details please 🙂",
      "question": "born on",
      "hint_text": "Select date of birth",
      "fields": "datefield",
      "ans": null
    },
    {
      "screen_name": "profession",
      "heading": "Something about how you keep busy. 💻",
      "question": "I am",
      "fields": "radio",
      "hint_text": "Select Options",
      "options": [
        {
          "key": "frontend",
          "text": "a frontend developer",
          "value": "a frontend developer"
        },
        {
          "key": "backend",
          "text": "a backend developer",
          "value": "a backend developer"
        },
        {
          "key": "designing",
          "text": "a UI/UX designer",
          "value": "a UI/UX designer"
        }
      ],
      "ans": null,
      "child_screen": {
        "frontend": [
          {
            "screen_name": "technology",
            "heading": "Something about how you keep busy. 💻",
            "question": "and I develop",
            "fields": "radio",
            "options": [
              {
                "text": "Web Application",
                "value": "web application"
              },
              {
                "text": "Mobile Application",
                "value": "mobile Application"
              }
            ],
            "ans": null
          }
        ],
        "backend": [
          {
            "screen_name": "technology",
            "heading": "Something about how you keep busy. 💻",
            "question": "and I have knowledge of",
            "hint_text": "Enter technology name",
            "fields": "textfield",
            "options": null,
            "ans": null
          }
        ],
        "designer": [
          {
            "screen_name": "technology",
            "heading": "Something about how you keep busy. 💻",
            "question": "and I have knowledge of",
            "hint_text": "Select Options",
            "fields": "radio",
            "options": [
              {
                "text": "Figma",
                "value": "figma"
              },
              {
                "text": "AdobeXD",
                "value": "adobe xd"
              }
            ],
            "ans": null
          }
        ]
      }
    }
  ]
}""";

  ///
  static String gamification = "Gamification";

  static String welcomeToElreio = "Welcome to Elredio";

  static String nameValidation = "Please enter a name!";

  static String somethingWentWrong = "Something went wrong!";

  static String pleaseSelectOneOption = "Please select an one option!";

  static String pleaseSelectDate = "Please select a date!";

  static String confirm = "Confirm";
  static String next = "Next";

  static String profileSummary = "Profile Summary";

  static String hi = "Hi";

  static String youDidIt = "You did it";

  static String reviewYourChanges =
      "Please review your answers below and do change if any or confirm and continue.";

  static String myPersonalDetails = "My personal details";

  static String howIKeepBusy = "How I Keep Busy";

  static String success = "Success";

  static String failure = "Failure";

  static String ok = "Ok";
}
