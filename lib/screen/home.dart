import 'package:desa_getasan_app/bloc/agenda_bloc.dart';
import 'package:desa_getasan_app/bloc/announcement_bloc.dart';
import 'package:desa_getasan_app/components/agenda_card.dart';
import 'package:desa_getasan_app/components/agenda_skeleton.dart';
import 'package:desa_getasan_app/components/announcement_list.dart';
import 'package:desa_getasan_app/components/emergency_contact_card.dart';
import 'package:desa_getasan_app/components/explore_card.dart';
import 'package:desa_getasan_app/components/home_header.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:desa_getasan_app/utils/parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(color: Pallete.primary),
      child: Column(
        children: [
          const HomeHeader(),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView(
              padding:
                  const EdgeInsets.all(16) + const EdgeInsets.only(top: 20),
              children: [
                const SectionTitle(title: 'Explor'),
                Container(
                  margin: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () => _openTorismMap(context),
                          child: const ExploreCard(
                            icon: 'map.svg',
                            title: 'Tourism Map',
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/market',
                              arguments: {'userProduct': false}),
                          child: const ExploreCard(
                            icon: 'market.svg',
                            title: 'Pasar',
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/market',
                              arguments: {'userProduct': true}),
                          child: const ExploreCard(
                            icon: 'trolly.svg',
                            title: 'Produk Saya',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/complaintBtnBg.png'),
                          fit: BoxFit.cover)),
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(context, '/complaint'),
                    title: const Text(
                      'Ajukan Aduan Anda',
                      style: TextStyle(
                          color: Color(0xff121212),
                          fontWeight: FontWeight.w800),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xff121212),
                    ),
                    leading: SvgPicture.asset(
                      'assets/icons/chat.svg',
                    ),
                    minLeadingWidth: double.minPositive,
                  ),
                ),
                const SectionTitle(title: 'Telepon Darurat'),
                Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 24),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            EmergencyContactCard(contact: 'Polisi'),
                            SizedBox(width: 10),
                            EmergencyContactCard(contact: 'Damkar')
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            EmergencyContactCard(contact: 'Puskesmas'),
                            SizedBox(width: 10),
                            EmergencyContactCard(contact: 'Perbekel')
                          ],
                        )
                      ],
                    )),
                const SectionTitle(title: 'Agenda'),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: BlocBuilder<AgendaBloc, AgendaState>(
                    builder: (context, state) {

                      if(state is AgendaLoaded){

                        if(state.agendas.isEmpty){
                          return Container(
                            color: const Color(0xffF4F5F6),
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.hourglass_empty_rounded),
                                Text('Tidak Ada Agenda')
                              ],
                            ),
                          );
                        }

                        return Column(
                          children: state.agendas.map( (e) => AgendaCard(
                            title: e.title, 
                            description: e.description, 
                            month: e.month, 
                            dateNum: e.dateNum,
                            day: e.day,
                            author: e.author
                          )).toList(),
                        );
                      }

                      if(state is AgendaFailed){
                        return Container(
                            color: const Color(0xffF4F5F6),
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.announcement_rounded),
                                Text('Tidak Ada Agenda')
                              ],
                            ),
                          );
                      }

                      return Column(
                        children: const [
                          AgendaSekeleton(),
                          AgendaSekeleton()
                        ],
                      );
                      
                    },
                  ),
                ),
                const SectionTitle(title: 'Pengumuman'),
                const SizedBox(height: 20),
                BlocBuilder<AnnouncementBloc, AnnouncementState>(
                  builder: (context, state) {
                    if (state is AnnouncementLoaded) {
                      return Column(
                        children: state.announcements
                            .map((e) => GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/announcementDetail',
                                      arguments: e),
                                  child: AnnouncementList(
                                    title: e.title,
                                    date: e.date,
                                    desc: Parser().textParser(e.description),
                                    img: e.image.toString(),
                                    author: e.updatedBy,
                                  ),
                                ))
                            .toList(),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }

  Future<void> _openTorismMap(context) async {

    Uri url = Uri.parse('https://map.desagetasan.id/');

    if(await canLaunchUrl(url)){
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Url gagal dibuka')
        )
      );
    }

  }

}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          color: Color.fromRGBO(18, 18, 18, 1),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ));
  }
}
