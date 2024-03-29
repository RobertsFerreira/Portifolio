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
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Robert da Silva Ferreira',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tocantins, Minas Gerais.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Bacharel em Ciência da computação com 2 anos de experiencia em desenvolvimento de software. Dentro dos 2 anos, o foco principal na área mobile e desktop e ocorrendo pequenas experiencias com web. Conhecimento sobre a linguagens Python e alguns frameworks como FastAPI e Flask para desenvolvimento de API, enquanto no desenvolvimento Front-end o foco é voltado para o dart com o framework Flutter.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 50),
            Text(
              'Idiomas',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.circle, size: 8),
                const SizedBox(width: 10),
                Text(
                  'Português - Nativo',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Experiências',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            Timeline(
              indicatorAlignment: Alignment.topCenter,
              itemGap: 20,
              indicatorCentered: true,
              leadings: const [
                TimelineYearLeadingItem(startYear: '2021', isCurrent: true),
              ],
              indicators: List.generate(
                1,
                (index) => const Icon(
                  Icons.circle,
                  size: 12,
                ),
              ),
              children: const [
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
              'Formações e Certificações',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            Timeline(
              indicatorAlignment: Alignment.topCenter,
              itemGap: 20,
              indicatorCentered: true,
              leadings: const [
                TimelineYearLeadingItem(startYear: '2019', endYear: '2023'),
                TimelineYearLeadingItem(startYear: '2023', endYear: '2024'),
                TimelineYearLeadingItem(startYear: '2022', endYear: '2022'),
              ],
              indicators: List.generate(
                3,
                (index) => const Icon(Icons.circle, size: 12),
              ),
              children: const [
                TimelineItem(
                  title: 'Bacharel em Ciência da Computação',
                  subTitle:
                      'Pelo Centro Universitário Governador Ozanan Coelho, Ubá - MG',
                  description:
                      'Neste curso foi demonstrado a base estrutural e lógica em áreas como a de desenvolvimento, redes. Demonstrações nas quais ocorreram através de trabalhos práticos. Em todos os sistemas eram obrigatórios que os alunos elaborassem por ideias de projetos que atendessem sobre os temas oferecidos e que pudesse ajudar a população local.',
                ),
                TimelineItem(
                  title: 'Pós-Graduação em Engenharia da Qualidade de Software',
                  subTitle: 'Pela Faculdade BookPlay, Birigui - SP',
                  description: '',
                ),
                TimelineItem(
                  title: 'Curso de Criação de Apps Android/iOS/Web com Flutter',
                  subTitle: 'Pela Udemy',
                  description:
                      'Curso introdutório de Flutter e Dart, iniciando com o ensino de conceitos básicos da linguagem. Ao avançar nos conceitos começam ser desenvolvidos projetos práticos para aplicar os conceitos ensinados.',
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
