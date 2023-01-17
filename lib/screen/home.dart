import 'package:desa_getasan_app/components/announcementList.dart';
import 'package:desa_getasan_app/components/emergencyContactCard.dart';
import 'package:desa_getasan_app/components/exploreCard.dart';
import 'package:desa_getasan_app/utils/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Pallete.primary
        ),
        child: Column(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Pallete.primary,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          maxLines: 1,
                          text: const TextSpan(
                            text: 'Hallo, ',
                            style: TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                text: 'Putu Gede!',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ]
                          )
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SvgPicture.asset('assets/icons/notification.svg'),
                            Positioned(
                              left: 10,
                              bottom: 15,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFAB00),
                                  shape: BoxShape.circle
                                ),
                                child: const Text(
                                  '3', 
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                )
                              )
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 5
                      ),
                      padding: const EdgeInsets.all(30),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/header-card-bg.png'),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Selamat Datang',
                              style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.w900,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Text(
                            'di Sistem Pelayanan\nDesa Getasan',
                            style: TextStyle(
                              fontSize: 14, 
                              // fontWeight: FontWeight.w900,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16) + const EdgeInsets.only(top: 20),
                  children: [
                    const SectionTitle(title: 'Explor'),
                    Container(
                      margin: const EdgeInsets.only(top: 12, left: 10, right: 10),
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: GestureDetector(
                              onTap: (){},
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
                              onTap: () => Navigator.pushNamed(context, '/market', arguments: { 'userProduct': false }),
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
                              onTap: () => Navigator.pushNamed(context, '/market', arguments: { 'userProduct': true }),
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
                          fit: BoxFit.cover
                        )
                      ),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, '/complaint'),
                        title: const Text(
                          'Ajukan Aduan Anda',
                          style: TextStyle(
                            color: Color(0xff121212),
                            fontWeight: FontWeight.w800
                          ),
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
                      )
                    ),
                    const SectionTitle(title: 'Pengumuman'),
                    const SizedBox(height: 20),
                     const AnnouncementList(
                      title: 'Acara Adat Desa Getasan',
                      date: '7 Januari 2023',
                      desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}





class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      style: const TextStyle(
        color: Color.fromRGBO(18, 18, 18, 1),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      )
    );
  }
}

