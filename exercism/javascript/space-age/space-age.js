export default function SpaceAge(seconds) {
  let earth_years = seconds/60/60/24/365.25;
  
  return {
    seconds,
    onMercury: function() {
      return +((earth_years/0.2408467).toFixed(2));
    },
    onVenus: function() {
      return +((earth_years/0.61519726).toFixed(2));
    },
    onEarth: function() {
      return +(earth_years.toFixed(2));
    },
    onMars: function() {
      return +((earth_years/1.8808158).toFixed(2));
    },
    onJupiter: function() {
      return +((earth_years/11.862615).toFixed(2));
    },
    onSaturn: function() {
      return +((earth_years/29.447498).toFixed(2));
    },
    onUranus: function() {
      return +((earth_years/84.016846).toFixed(2));
    },
    onNeptune: function() {
      return +((earth_years/164.79132).toFixed(2));
    }
  };

};
