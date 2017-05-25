import { renderComponent, branch } from 'recompose';
import { Loading, Err, BlankState } from '../components';

const displayLoading = branch(
  (props) => props.data.loading,
  renderComponent(Loading),
);

const displayError = branch(
  (props) => props.data.error,
  renderComponent(Err),
);

const displayBlankState = branch(
  (props) => props.data.assets && props.data.assets.length === 0,
  renderComponent(BlankState),
);

export {
  displayLoading,
  displayError,
  displayBlankState,
};
