(function () {
    'use strict';

    /**
     * Common utility variables and functions.
     */
    const Utility = {
        viewport: {
            small: 640,
            medium: 1024,
            large: 1200
        }
    };

    /**
     * A horizontal menu with drop-down submenus.
     */
    class MenuHorizontal {
        constructor(selector) {
            this.menuElement = document.querySelector(selector);

            if (!this.menuElement) {
                throw (`${selector} was not found in the DOM`);
            }

            this.submenuElements = this.menuElement.querySelectorAll('.submenu');
        }

        /**
         * Initializes menu.
         */
        init() {
            this.addAriaAttrs();
            this.addListeners();
        }

        /**
         * Adds appropriate ARIA attributes to menu.
         */
        addAriaAttrs() {
            const submenuArray = Array.from(this.submenuElements);

            submenuArray.forEach(submenuElement => {
                const triggerElement = this.getTriggerElement(submenuElement);

                triggerElement.setAttribute('aria-haspopup', 'true');
                triggerElement.setAttribute('aria-expanded', 'false');
            });
        }

        /**
         * Adds event listeners to expand/collapse submenus.
         */
        addListeners() {
            const submenuArray = Array.from(this.submenuElements);

            submenuArray.forEach(submenuElement => {
                const triggerElement = this.getTriggerElement(submenuElement);

                // Show submenu on touch event
                triggerElement.addEventListener('touchend', e => {
                    this.toggleSubmenu(submenuElement);
                    e.preventDefault();
                }, false);

                // Show submenu on click (or Enter/Space key press)
                triggerElement.addEventListener('click', e => {
                    const viewportNotSmall = window
                        .matchMedia(`(min-width: ${Utility.viewport.small}px)`).matches;

                    if (viewportNotSmall && (e.screenX > 0 || e.screenY > 0)) {
                        // We only care about keyboard events for large viewports
                        return;
                    }

                    this.toggleSubmenu(submenuElement);
                    e.preventDefault();
                }, false);

                // Change aria-expanded on mouse hover (large viewports)
                triggerElement.parentElement.addEventListener('mouseover', e => {
                    const viewportNotSmall = window
                        .matchMedia(`(min-width: ${Utility.viewport.small}px)`).matches;
                    const submenuExpanded = this.isSubmenuExpanded(submenuElement);

                    if (viewportNotSmall && !submenuExpanded) {
                        this.showSubmenu(submenuElement);
                    }
                }, false);

                triggerElement.parentElement.addEventListener('mouseleave', e => {
                    const viewportNotSmall = window
                        .matchMedia(`(min-width: ${Utility.viewport.small}px)`).matches;
                    const submenuExpanded = this.isSubmenuExpanded(submenuElement);

                    if (viewportNotSmall && submenuExpanded) {
                        this.hideSubmenus();
                    }
                }, false);
            });
        }

        /**
         * Returns the element that triggers a submenu.
         * @param {HTMLElement} submenuElement The submenu element.
         */
        getTriggerElement(submenuElement) {
            const triggerElement = submenuElement.parentElement.firstElementChild;
            return triggerElement;
        }

        /**
         * Returns whether the submenu is currently expanded.
         * @param {HTMLElement} submenuElement The submenu element.
         */
        isSubmenuExpanded(submenuElement) {
            const triggerElement = this.getTriggerElement(submenuElement);
            const submenuExpanded = triggerElement
                .getAttribute('aria-expanded') === 'true';

            return submenuExpanded;
        };

        /**
         * Shows a submenu by setting its aria-expanded attribute.
         * @param {HTMLElement} submenuElement The submenu element.
         */
        showSubmenu(submenuElement) {
            const triggerElement = this.getTriggerElement(submenuElement);
            triggerElement.setAttribute('aria-expanded', 'true');
        }

        /**
         * Hides all submenus by setting their aria-expanded attribute.
         */
        hideSubmenus() {
            const submenuArray = Array.from(this.submenuElements);

            submenuArray.forEach(submenuElement => {
                const triggerElement = this.getTriggerElement(submenuElement);
                triggerElement.setAttribute('aria-expanded', 'false');
            });
        }

        /**
         * Hides all submenus, then toggles the state of the provided submenu.
         * @param {HTMLElement} submenuElement The submenu element.
         */
        toggleSubmenu(submenuElement) {
            const submenuExpanded = this.isSubmenuExpanded(submenuElement);

            this.hideSubmenus();

            if (!submenuExpanded) {
                this.showSubmenu(submenuElement);
            }
        }
    }

    // Implement menu when DOM is ready
    document.addEventListener('DOMContentLoaded', e => {
        const menu = new MenuHorizontal('.menu-horizontal');
        menu.init();
    }, false);
})();