import React from "react"
import PropTypes from "prop-types"
import Navbar from './Navbar'

class HelloWorld extends React.Component {
  constructor(props) {
    super(props);
  }
  render () {
    return (
      <React.Fragment>
        <Navbar />
        <h1>
          Hello {this.props.greeting}
        </h1>
        <a href="/welcome/1">Click me!</a>
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};

export default HelloWorld
