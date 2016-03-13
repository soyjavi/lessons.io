import React from 'react';
// -- Components
import Title from '../../components/title'
// -- Context
import Episode from './Serie.Episode'
import style from './style.scss';

const Serie = props => {
  const stylesheet = {
    backgroundImage: `url(https://images.duckduckgo.com/iu/?u=http%3A%2F%2Ffacebook.github.io%2Freact%2Fimg%2Flogo_og.png&f=1)`
  };
  const serie_url = 'aprender-react';

  return (
    <article className={style.root}>
      <Title className={style.title}>
        <figure className={style.serieThumbnail} style={stylesheet} />
        <div className={style.preview}>
          <h1>Aprende React</h1>
          <p className={style.description}>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages..</p>
        </div>
      </Title>
      <section className={style.info}>
        <div className={style.wrapper}>
          <h4>20<small>chapters</small></h4>
          <h4>174<small>minutes</small></h4>
        </div>
      </section>
      <section className={style.content}>
        <div className={style.wrapper}>
          <hr/>
          <h3>SERIES LESSONS</h3>
          <small>Watch, Learn, and Code</small>

          <nav className={style.episodes}>
            <Episode length={3.34} number={1} title='Introduccion' url={serie_url} />
            <Episode length={4.34} number={2} title='Configuracion' url={serie_url} />
            <Episode length={6.34} number={3} title='Tu primer componente' url={serie_url} />
          </nav>
        </div>
      </section>
    </article>
  );
};

export default Serie;
