class Weather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Weather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  get getTemp {
    return double.parse((temp).toStringAsFixed(1));
  }

  get getFeelsLike {
    return double.parse((feelsLike).toStringAsFixed(1));
  }

  get getTempMin {
    return double.parse((tempMin).toStringAsFixed(1));
  }

  get getTempMax {
    return double.parse((tempMax).toStringAsFixed(1));
  }

  get getPressure {
    return double.parse((pressure).toStringAsFixed(1));
  }

  get getHumidity {
    return double.parse((humidity).toStringAsFixed(1));
  }
}
