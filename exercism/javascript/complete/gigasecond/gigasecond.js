class Gigasecond {
  constructor(utc_time) {
    this.utc_time = utc_time;
  }

  date() {
    //parse returns milliseconds from UTC epoch
    return new Date(Date.parse(this.utc_time)+1000000000000);
  };
};

export default Gigasecond;
