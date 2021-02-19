import 'package:flutter/material.dart';
import 'package:fluttercovidapp/data/network.dart';

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future positif;
  Future meninggal;
  Future sembuh;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    positif = getPositif();
    meninggal = getMeninggal();
    sembuh = getSembuh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Positif', 'value', Colors.orange),
                _buildStatCard('Deaths', 'value', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            FutureBuilder(
                future: positif,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "${snapshot.data[0][count]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            FutureBuilder(
                future: meninggal,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Deaths, ${snapshot.data[0][count]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            FutureBuilder(
                future: sembuh,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Recovered, ${snapshot.data[0][count]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
Future getPositif() async {
  Network network = Network("https://api.kawalcorona.com/positif");
  return network.fetchData();
}

Future getMeninggal() async {
  Network network = Network("https://api.kawalcorona.com/meninggal/");
  return network.fetchData();
}

Future getSembuh() async {
  Network network = Network("https://api.kawalcorona.com/sembuh/");
  return network.fetchData();
}

