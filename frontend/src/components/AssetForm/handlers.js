const handlers = {
  onClick: (props) => (e) => {
    e.preventDefault();
    props.createAsset(props.name, 'shams')
      .then(({ data }) => console.log('got data', data))
      .catch((error) => console.log('there was an error', error));
  },
  onChange: (props) => (e) => {
    props.updateName(e.target.value);
  },
};

export default handlers;
