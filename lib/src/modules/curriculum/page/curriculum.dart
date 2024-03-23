import 'package:flutter/material.dart';
import 'package:portifolio/src/modules/core/components/timeline/timeline_component.dart';

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
                Column(
                  children: [
                    Text('2019'),
                    Text('a'),
                    Text('2023'),
                  ],
                ),
                Column(
                  children: [
                    Text('2023'),
                    Text('a'),
                    Text('2024'),
                  ],
                )
              ],
              indicators: List.generate(
                2,
                (index) => const Icon(
                  Icons.circle,
                  size: 12,
                ),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bacharel em Ciência da Computação',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text(
                      'Pelo Centro Universitário Governador Ozana Coelho, Ubá - MG ',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pós-Graduação em Engenharia da Qualidade de Software',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text(
                      'Pela Faculdade Bookplay, Birigui - SP ',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Experiências',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            const Text('This is the curriculum page'),
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
