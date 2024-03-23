import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/core/components/timeline/timeline_component.dart';

import '../../core/components/timeline/timeline_item.dart';
import '../../core/components/timeline/timeline_leading_item.dart';

class Curriculum extends StatefulWidget {
  const Curriculum({super.key});

  @override
  State<Curriculum> createState() => _CurriculumState();
}

class _CurriculumState extends State<Curriculum> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              'Perfil',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent rhoncus suscipit orci porttitor sollicitudin. Proin eu eros hendrerit, malesuada nunc sed, tincidunt metus. Vestibulum auctor eget eros quis imperdiet. Vivamus in mi ultricies, consectetur ex quis, pharetra sapien. Integer maximus lacus nec nisl ultricies molestie. Proin sodales lobortis tellus a tristique. Sed sed auctor tellus, eget dapibus odio. Pellentesque urna nulla, dapibus vitae varius ut, tempus sed libero. In tempor dignissim scelerisque. Maecenas vel felis hendrerit, commodo ipsum et, suscipit arcu. Etiam consectetur orci et condimentum porta. Aliquam tristique nisl convallis, egestas sapien sed, facilisis erat.Maecenas vel erat et orci aliquet sodales eu ut velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus aliquam, ante consequat finibus posuere, mauris arcu vestibulum enim, at gravida purus ipsum sed augue. Integer a nisl consequat, mattis nisi in, molestie justo. Nullam eleifend velit quis est posuere interdum. Donec a pellentesque ex, eu malesuada felis. Suspendisse lobortis ut lorem eget interdum. Aliquam erat volutpat. Proin in libero magna. Donec blandit nisi mauris, quis vehicula sem pellentesque eget. Nullam sed metus nisl. Donec consequat massa lorem, a aliquet risus ullamcorper ut. Cras porttitor justo eu iaculis consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            const SizedBox(height: 50),
            Text(
              'Formações',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Timeline(
              indicatorAlignment: Alignment.topCenter,
              itemGap: 20,
              indicatorCentered: true,
              leadings: const [
                TimelineYearLeadingItem(
                  startYear: '2019',
                  endYear: '2023',
                ),
                TimelineYearLeadingItem(
                  startYear: '2023',
                  endYear: '2024',
                ),
              ],
              indicators: List.generate(
                2,
                (index) => const Icon(
                  Icons.circle,
                  size: 12,
                ),
              ),
              children: const [
                TimelineItem(
                  title: 'Pós-Graduação em Engenharia da Qualidade de Software',
                  description:
                      'Pelo Centro Universitário Governador Ozana Coelho, Ubá - MG',
                ),
                TimelineItem(
                  title: 'Bacharel em Ciência da Computação',
                  description: 'Pela Faculdade Bookplay, Birigui - SP',
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Experiências',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            Timeline(
              indicatorAlignment: Alignment.topCenter,
              itemGap: 20,
              indicatorCentered: true,
              leadings: const [
                TimelineYearLeadingItem(startYear: '2021', endYear: '2022'),
                TimelineYearLeadingItem(startYear: '2022', isCurrent: true),
              ],
              indicators: List.generate(
                2,
                (index) => const Icon(
                  Icons.circle,
                  size: 12,
                ),
              ),
              children: const [
                TimelineItem(
                  title: 'Suporte Técnico',
                  subTitle: 'Empresa: VeeV Sistemas, Tocantins - MG',
                  description:
                      'Suporte ao cliente realizando atendimentos presencialmente e on-line. Nos atendimentos era feito a analise dos erros reportados pelo clientes e também os seus pedidos de alteração.\nTesters das aplicações da empresa realizando busca de bugs e problemas nas alterações realizadas.',
                ),
                TimelineItem(
                  title: 'Programador Full - Stack',
                  subTitle: 'Empresa: VeeV Sistemas, Tocantins - MG',
                  description:
                      'Responsável pelo desenvolvimento e manutenção dos softwares mais atuais da empresa, no qual era realizadas utilizando Dart e Flutter, em conjunto com Python e os frameworks Flask e FastApi',
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Certificações',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            const Text('This is the curriculum page'),
            const SizedBox(height: 50),
            Text(
              'Habilidades',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            const Text('This is the curriculum page'),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
