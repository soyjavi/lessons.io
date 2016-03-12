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
        <Item
          lessons={12}
          level='principiante'
          thumbnail='http://soyjavi.com/assets/images/soyjavi.jpg'
          title='Aprende React'
          url='/serie/aprender-react'
        />

        <Item
          lessons={12}
          level='intermedio'
          thumbnail='http://'
          title='Aprende Redux'
          url='http://'
        />
      </section>
    </article>
  );
};

export default Series;
