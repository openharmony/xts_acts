import appStorageJsunit from './AppStorageJsunit.test.ets';
import linkJsunit from './LinkJsunit.test.ets';
import propJsunit from './PropJsunit.test.ets';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test.ets';
import listJsunit from './ListJsunit.test.ets';
import tabJsunit from './TabJsunit.test.ets';
import swiperJsunit from './SwiperJsunit.test.ets';
import panelJsunit from './PanelJsunit.test.ets';
import navigatorJsunit from './NavigatorJsunit.test.ets';
import rowJsunit from './RowJsunit.test.ets';
import listItemJsunit from './ListItemJsunit.test.ets';
import hyperlinkJsunit from './HyperLinkJsunit.test.ets';
import gridItemJsunit from './GridItem.test.ets';
import gridJsunit from './GridJsnuit.test.ets';
import videoJsunit from './VideoJsunit.test.ets';
export default function testsuite() {
  alphabetIndexerJsunit()
  hyperlinkJsunit()
  rowJsunit()
  gridJsunit()
  gridItemJsunit()
  navigatorJsunit()
  panelJsunit()
  swiperJsunit()
  tabJsunit()
  propJsunit()
  linkJsunit()
  appStorageJsunit()
  videoJsunit()
  listItemJsunit()
  listJsunit()
}