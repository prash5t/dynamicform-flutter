Map<String, dynamic> dynamicFormMockData = {
  "pages": [
    {
      "title": "Personal Info",
      "fields": [
        {
          "key": "firstName",
          "type": "text",
          "label": "First Name",
          "validation": {
            "required": true,
            "pattern": "[a-zA-Z]",
            "minLength": 2,
            "maxLength": 50,
            "inputType": "name"
          }
        },
        {
          "key": "lastName",
          "type": "text",
          "label": "Last Name",
          "validation": {
            "required": true,
            "pattern": "[a-zA-Z]",
            "minLength": 2,
            "maxLength": 50,
            "inputType": "name"
          }
        },
        {
          "key": "profession",
          "type": "dropdown",
          "label": "Profession",
          "options": [
            {"display": "Student", "value": "0"},
            {"display": "Business", "value": "1"},
            {"display": "Job", "value": "2"},
          ],
          "validation": {"required": true}
        },
        {
          "key": "gender",
          "type": "radio",
          "label": "Gender",
          "options": [
            {"display": "Male", "value": "M"},
            {"display": "Female", "value": "F"}
          ],
          "validation": {"required": true}
        },
        {
          "key": "dob",
          "type": "date",
          "label": "Date of Birth",
          "validation": {
            "required": true,
            "startDate": "1990-01-20T01:01:55.200Z",
            "endDate": "2019-08-15T12:00:00Z",
          }
        }
      ]
    },
    {
      "title": "Contact Info",
      "fields": [
        {
          "key": "email",
          "type": "text",
          "label": "Email",
          "validation": {
            "required": true,
            "minLength": 4,
            "maxLength": 60,
            "inputType": "email"
          }
        },
        {
          "key": "phone",
          "type": "text",
          "label": "Phone Number",
          "validation": {
            "required": false,
            "pattern": "[0-9]",
            "minLength": 5,
            "maxLength": 15,
            "inputType": "phone"
          }
        },
      ]
    },
    {
      "title": "Your Preferences",
      "fields": [
        {
          "key": "hobby",
          "type": "text",
          "label": "What's your hobby?",
          "validation": {
            "required": false,
            "minLength": 2,
            "maxLength": 200,
            "inputType": "multiline"
          }
        },
        {
          "key": "diet",
          "type": "dropdown",
          "label": "Diet",
          "options": [
            {"display": "VEG", "value": "0"},
            {"display": "NON-VEG", "value": "1"},
          ],
          "validation": {"required": true}
        },
        {
          "key": "drinks",
          "type": "radio",
          "label": "Do you drink?",
          "options": [
            {"display": "Yes", "value": "0"},
            {"display": "No", "value": "1"},
          ],
          "validation": {"required": true}
        },
      ]
    }
  ]
};
