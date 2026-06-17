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
