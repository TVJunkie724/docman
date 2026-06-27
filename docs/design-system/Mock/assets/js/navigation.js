(function () {
  const inPages = window.location.pathname.includes('/pages/');
  const mockPrefix = inPages ? '../' : './';
  const rootPrefix = inPages ? '../../../../' : '../../../';

  const groups = [
    { label: 'Portal', items: [['Overview', 'index.html']] },
    {
      label: 'Corporate Design',
      items: [
        ['Corporate Design', 'pages/corporate-design.html'],
        ['Logo', 'pages/corporate-logo.html'],
        ['Colors', 'pages/corporate-colors.html'],
        ['Voice', 'pages/corporate-voice.html'],
        ['Standards', 'pages/corporate-standards.html'],
      ],
    },
    {
      label: 'Foundations',
      items: [
        ['Foundations', 'pages/foundations.html'],
        ['Palette', 'pages/color-palette.html'],
        ['Icons', 'pages/icon-set.html'],
        ['Fonts', 'pages/fonts.html'],
        ['Spacing', 'pages/spacing.html'],
        ['Product Shell', 'pages/product-shell.html'],
      ],
    },
    {
      label: 'Components',
      items: [
        ['Components', 'pages/components.html'],
        ['Buttons', 'pages/component-buttons.html'],
        ['Forms', 'pages/component-forms.html'],
        ['Form Interactions', 'pages/component-form-interactions.html'],
        ['Navigation', 'pages/component-navigation.html'],
        ['Status', 'pages/component-status.html'],
        ['Tags', 'pages/component-tags.html'],
        ['Feedback', 'pages/component-feedback.html'],
        ['Data Display', 'pages/data-display.html'],
      ],
    },
    {
      label: 'Patterns & Standards',
      items: [
        ['Patterns', 'pages/patterns.html'],
        ['Accessibility', 'pages/component-accessibility.html'],
      ],
    },
  ];

  const sidebar = document.querySelector('[data-design-navigation]');
  const calloutIcons = {
    alert: '<svg viewBox="0 0 24 24"><path d="M12 9v4"></path><path d="M12 17h.01"></path><path d="M10.3 4.6 2.7 18a2 2 0 0 0 1.7 3h15.2a2 2 0 0 0 1.7-3L13.7 4.6a2 2 0 0 0-3.4 0Z"></path></svg>',
    check: '<svg viewBox="0 0 24 24"><path d="M20 6 9 17l-5-5"></path></svg>',
    error: '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"></circle><path d="m15 9-6 6"></path><path d="m9 9 6 6"></path></svg>',
    info: '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"></circle><path d="M12 11v5"></path><path d="M12 8h.01"></path></svg>',
    message: '<svg viewBox="0 0 24 24"><path d="M4 4h16v12H5.2L4 17.2V4Z"></path><path d="M8 9h8"></path><path d="M8 12h5"></path></svg>',
    shield: '<svg viewBox="0 0 24 24"><path d="M12 3 5 6v5c0 4.5 3 8.2 7 10 4-1.8 7-5.5 7-10V6l-7-3Z"></path><path d="M9.5 12.5 11 14l3.5-4"></path></svg>',
    timer: '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"></circle><path d="M12 7v5l3 2"></path></svg>',
  };

  document.querySelectorAll('[data-callout-icon]').forEach((token) => {
    const icon = calloutIcons[token.dataset.calloutIcon];
    if (icon) token.innerHTML = icon;
  });

  if (!sidebar) return;

  const currentFile = window.location.pathname.split('/').pop();

  sidebar.innerHTML = `
    <div class="brand">
      <img src="${rootPrefix}assets/images/logo.png" alt="Ordna Logo" />
      <div>
        <strong>Ordna</strong>
        <span>Ordnung fuer Zuhause</span>
      </div>
    </div>
    <nav class="nav" aria-label="Design-System-Navigation">
      ${groups.map((group) => `
        <div class="nav-section">${group.label}</div>
        ${group.items.map(([label, href]) => {
          const file = href.split('/').pop();
          const active = currentFile === file;
          return `<a class="nav-link" ${active ? 'aria-current="page"' : ''} href="${mockPrefix}${href}">${label}</a>`;
        }).join('')}
      `).join('')}
    </nav>
  `;
})();
