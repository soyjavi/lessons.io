import React from 'react';
// -- Components
import Particles from '../../components/particles'
// -- Context
import style from './style.scss';

const Unknown = props => {
  return (
    <section className={style.root}>
      <h1>Unknown...</h1>
      <Particles className={style.particles} />
    </section>
  );
};

export default Unknown;
