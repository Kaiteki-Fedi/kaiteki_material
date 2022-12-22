class Email {
  final String sender;
  final String subject;
  final String body;
  final int? count;

  const Email(this.sender, this.subject, this.body, [this.count]);
}

const exampleEmails = [
  Email(
    "Ali Connors",
    "Brunch this weekend?",
    "I'll be in your neighborhood doing errands this weekend. Do you want to grab brunch?",
  ),
  Email(
    "to Alex, Scott, Jennifer",
    "Summer BBQ",
    "Wish I could come, but I'm out of town this weekend.",
  ),
  Email(
    "Sandra Adams",
    "Oui Oui",
    "Do you have Paris recommendations? Have you ever been?",
  ),
  Email(
    "Trevor Hansen",
    "Birthday gift",
    "Have any ideas about what we should get Heidi for her birthday? How about a pony?",
  ),
  Email(
    "Britta Holt",
    "Recipe to try",
    "We should eat this: grated squash. Corn and tomatillo tacos.",
  ),
  // Email(
  //   "David Park",
  //   "Giants game",
  //   "Any interest in seeing the Giants game this weekend?",
  // ),
];
