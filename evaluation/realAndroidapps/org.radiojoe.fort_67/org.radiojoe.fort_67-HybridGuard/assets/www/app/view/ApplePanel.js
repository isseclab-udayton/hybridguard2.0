/*
 * File: app/view/ApplePanel.js
 *
 * This file was generated by Sencha Architect version 2.1.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Sencha Touch 2.0.x library, under independent license.
 * License of Sencha Architect does not include license for Sencha Touch 2.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('FortVancouverMobile.view.ApplePanel', {
    extend: 'Ext.Panel',
    alias: 'widget.applepanel',

    requires: [
        'FortVancouverMobile.view.ApplePanelContainer'
    ],

    config: {
        ui: '',
        layout: {
            type: 'fit'
        },
        items: [
            {
                xtype: 'applepanelcontainer'
            },
            {
                xtype: 'toolbar',
                docked: 'bottom',
                height: '60px',
                items: [
                    {
                        xtype: 'button',
                        id: 'applehomebutton',
                        itemId: 'applehomebutton',
                        iconCls: 'home',
                        iconMask: true,
                        text: ''
                    },
                    {
                        xtype: 'spacer'
                    },
                    {
                        xtype: 'button',
                        id: 'applebackbutton',
                        itemId: 'applebackbutton',
                        ui: 'back',
                        width: '40px',
                        iconCls: 'back',
                        iconMask: true,
                        text: ''
                    },
                    {
                        xtype: 'button',
                        id: 'appleforwardbutton',
                        itemId: 'appleforwardbutton',
                        ui: 'forward',
                        width: '40px',
                        iconCls: 'forward',
                        iconMask: true,
                        text: ''
                    },
                    {
                        xtype: 'spacer'
                    },
                    {
                        xtype: 'button',
                        id: 'applepathbutton',
                        iconCls: 'path',
                        iconMask: true,
                        text: ''
                    },
                    {
                        xtype: 'button',
                        id: 'applehaversackbutton',
                        iconCls: 'haversack',
                        iconMask: true,
                        text: ''
                    }
                ]
            }
        ]
    }

});