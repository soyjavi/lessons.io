import React from 'react';
import style from './style.scss';

const Header = props => {
  return (
    <header className={style.root}>
      <div className={style.brand}>
        <img className={style.logo} />
        <h4 className={style.title}>lessons.io</h4>
      </div>
      <nav className={style.menu}>
        <a href='#'>Episodios</a>
        <a href='#'>Roadmap</a>
        <a href='#'>About</a>
      </nav>
      <nav className={style.session}>
        <a href='#'>Login</a>
      </nav>
    </header>
  );
};

Header.propTypes = {
  session: React.PropTypes.object
};

Header.defaultProps = {
  object: undefined
};

export default Header;
