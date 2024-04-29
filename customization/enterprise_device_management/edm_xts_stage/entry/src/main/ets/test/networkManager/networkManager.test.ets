/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, NETWORK_ETH_LOCAL } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import networkManager from '@ohos.enterprise.networkManager';

export default function networkManagerTest() {
  describe('networkManager_test', () => {
    testGetAllNetworkInterfacesSync();
    testGetIpAddressSync();

    testGetMacSync();

    testIsNetworkInterfaceDisabledSync();
    testSetNetworkInterfaceDisabledSync();

    testSetGlobalProxySync();
    testGetGlobalProxySync();

    testAddFirewallRule();
    testRemoveFirewallRule();
    testGetFirewallRules();

    testAddDomainFilterRule();
    testRemoveDomainFilterRule();
    testGetDomainFilterRules();
  })
}

function testGetAllNetworkInterfacesSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_ALL_NETWORK_INTERFACES_SYNC_JS_0100
   * @tc.name      : test_get_all_network_interfaces_sync_0100
   * @tc.desc      : test networkManager getAllNetworkInterfacesSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_all_network_interfaces_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getAllNetworkInterfacesSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetIpAddressSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_IP_ADDRESS_SYNC_JS_0100
   * @tc.name      : test_get_ip_address_sync_0100
   * @tc.desc      : test networkManager getIpAddressSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_ip_address_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getIpAddressSync(SELFWANT, '1');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetMacSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_MAC_SYNC_JS_0100
   * @tc.name      : test_get_mac_sync_0100
   * @tc.desc      : test networkManager getMacSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_mac_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getMacSync(SELFWANT, NETWORK_ETH_LOCAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testIsNetworkInterfaceDisabledSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.name      : test_is_network_interface_disable_sync_0100
   * @tc.desc      : test networkManager isNetworkInterfaceDisabledSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.isNetworkInterfaceDisabledSync(SELFWANT, '1');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testSetNetworkInterfaceDisabledSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_NETWORK_INTERFACE_DISABLE_SYNC_JS_0100
   * @tc.name      : test_set_network_interface_disable_sync_0100
   * @tc.desc      : test networkManager setNetworkInterfaceDisabledSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_network_interface_disable_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setNetworkInterfaceDisabledSync(SELFWANT, '1', false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testSetGlobalProxySync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.name      : test_set_global_proxy_sync_0100
   * @tc.desc      : test networkManager setGlobalProxySync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.setGlobalProxySync(SELFWANT, {
        host: 'www.xxxx.com',
        port: 80,
        exclusionList: []
      });
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetGlobalProxySync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_GLOBAL_PROXY_SYNC_JS_0100
   * @tc.name      : test_get_global_proxy_sync_0100
   * @tc.desc      : test networkManager getGlobalProxySync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_global_proxy_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getGlobalProxySync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testAddFirewallRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0100
   * @tc.name      : test_add_firewall_rule_0100
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let firewallRule: networkManager.FirewallRule = {
        srcAddr: '192.168.1.1-192.168.1.22',
        destAddr: '192.168.2.1',
        srcPort: '8080',
        destPort: '8080',
        appUid: '9696',
        direction: networkManager.Direction.OUTPUT,
        action: networkManager.Action.DENY,
        protocol: networkManager.Protocol.UDP
      };
      networkManager.addFirewallRule(SELFWANT, firewallRule);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0200
   * @tc.name      : test_add_firewall_rule_0200
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0200", Level.LEVEL2, async (done: Function) => {
    try {
      let firewallRule: networkManager.FirewallRule = {
        srcAddr: '192.168.1.1-192.168.1.22',
        destAddr: '192.168.2.1',
        srcPort: '8080',
        destPort: '8080',
        appUid: '9696',
        direction: networkManager.Direction.INPUT,
        action: networkManager.Action.ALLOW,
        protocol: networkManager.Protocol.ALL
      };
      networkManager.addFirewallRule(SELFWANT, firewallRule);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0300
   * @tc.name      : test_add_firewall_rule_0300
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0300", Level.LEVEL2, async (done: Function) => {
    try {
      let firewallRule: networkManager.FirewallRule = {
        srcAddr: '192.168.1.1-192.168.1.22',
        destAddr: '192.168.2.1',
        srcPort: '8080',
        destPort: '8080',
        appUid: '9696',
        direction: networkManager.Direction.INPUT,
        action: networkManager.Action.ALLOW,
        protocol: networkManager.Protocol.TCP
      };
      networkManager.addFirewallRule(SELFWANT, firewallRule);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_FIREWALL_RULE_JS_0400
   * @tc.name      : test_add_firewall_rule_0400
   * @tc.desc      : test networkManager addFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_firewall_rule_0400", Level.LEVEL2, async (done: Function) => {
    try {
      let firewallRule: networkManager.FirewallRule = {
        srcAddr: '192.168.1.1-192.168.1.22',
        destAddr: '192.168.2.1',
        srcPort: '8080',
        destPort: '8080',
        appUid: '9696',
        direction: networkManager.Direction.INPUT,
        action: networkManager.Action.ALLOW,
        protocol: networkManager.Protocol.ICMP
      };
      networkManager.addFirewallRule(SELFWANT, firewallRule);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testRemoveFirewallRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_FIREWALL_RULE_JS_0100
   * @tc.name      : test_remove_firewall_rule_0100
   * @tc.desc      : test networkManager removeFirewallRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_firewall_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeFirewallRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetFirewallRules() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_FIREWALL_RULES_JS_0100
   * @tc.name      : test_get_firewall_rules_0100
   * @tc.desc      : test networkManager getFirewallRules without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_firewall_rules_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getFirewallRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testAddDomainFilterRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DOMAIN_FILTER_RULE_JS_0100
   * @tc.name      : test_add_domain_filter_rule_0100
   * @tc.desc      : test networkManager addDomainFilterRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let rule: networkManager.DomainFilterRule = {
        domainName: 'www.example.com',
        appUid: '9696',
        action: networkManager.Action.DENY
      };
      networkManager.addDomainFilterRule(SELFWANT, rule);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testRemoveDomainFilterRule() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DOMAIN_FILTER_RULE_JS_0100
   * @tc.name      : test_remove_domain_filter_rule_0100
   * @tc.desc      : test networkManager removeDomainFilterRule without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_domain_filter_rule_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.removeDomainFilterRule(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetDomainFilterRules() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DOMAIN_FILTER_RULES_JS_0100
   * @tc.name      : test_get_domain_filter_rules_0100
   * @tc.desc      : test networkManager getDomainFilterRules without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_domain_filter_rules_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getDomainFilterRules(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}