class Bob {
  hey(message) {
    message = message.trim();
    let regexp_normal = /\w$|[.!]$/;
    let regexp_q = /[?]$/;
    let regexp_loud = /[A-Z]{4,}|[A-Z]{2,}[!]$/;

    if (regexp_loud.test(message) && regexp_q.test(message)) {
      return "Calm down, I know what I\'m doing!";
    } else if (regexp_loud.test(message)) {
      return "Whoa, chill out!";
    } else if (regexp_q.test(message)) {
      return "Sure.";
    } else if (regexp_normal.test(message)) {
      return "Whatever.";
    } else {
      return "Fine. Be that way!";
    }
  };
};

export default Bob;
