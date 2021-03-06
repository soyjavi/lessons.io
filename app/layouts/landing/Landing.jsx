import React from 'react';
// -- Components
import Button from '../../components/button'
import Title from '../../components/title'
// -- Context
import style from './style.scss';
import C from '../../constants'

const Landing = props => {
  return (
    <section data-component-layout='finder' className={style.root}>
      <Title caption={C.SITE.TITLE} className={style.title} description={C.SITE.DESCRIPTION}>
        <Button
          href='/join'
          caption='Unlock the knowledge'
          legend='click here to level up'
          accent
          className={style.button}
        />
      </Title>
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
