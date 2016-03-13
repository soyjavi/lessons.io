import React from 'react';
// -- Components
import Title from '../../components/title'
// -- Context
import Item from './Series.Item'
import style from './style.scss';

const Series = props => {
  return (
    <article>
      <Title caption='Series disponibles' description='Lorem ipsum...' />
      <section className={style.root}>
        <div className={style.wrapper}>
          <Item
            lessons={12}
            level='principiante'
            thumbnail='https://images.duckduckgo.com/iu/?u=http%3A%2F%2Ffacebook.github.io%2Freact%2Fimg%2Flogo_og.png&f=1'
            title='Aprende React'
            url='aprender-react'
          />

          <Item
            lessons={12}
            level='intermedio'
            thumbnail='http://'
            title='Aprende Redux'
            url='http://'
          />

          <Item
            lessons={12}
            level='principiante'
            thumbnail='https://images.duckduckgo.com/iu/?u=http%3A%2F%2Ffacebook.github.io%2Freact%2Fimg%2Flogo_og.png&f=1'
            title='Aprende React'
            url='aprender-react'
            disabled
          />
        </div>
      </section>
    </article>
  );
};

export default Series;
