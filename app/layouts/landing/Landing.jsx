import React from 'react';
// -- Components
import Button from '../../components/button'
import Particles from '../../components/particles'
// -- Context
import style from './style.scss';
import C from '../../constants'

const Landing = props => {
  return (
    <section data-component-layout='finder' className={style.root}>
      <div className={style.wrapper}>
        <h1>{C.SITE.TITLE}</h1>
        <h4 className={style.description}>{C.SITE.DESCRIPTION}</h4>
        <Button
          href='/join'
          caption='Unlock the knowledge'
          legend='click here to level up'
          accent
        />
      </div>
      <Particles />
    </section>
  );
};

Landing.propTypes = {
  caption: React.PropTypes.string
};

Landing.defaultProps = {
  caption: ''
};

Landing.onClick = function() {
  alert('Hello world')
};

export default Landing;
