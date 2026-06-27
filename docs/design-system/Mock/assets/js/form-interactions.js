(function () {
  function closePopovers(except) {
    document.querySelectorAll('[data-popover]').forEach((popover) => {
      if (popover.dataset.popover !== except) {
        popover.classList.remove('is-open');
        const trigger = document.querySelector(`[data-popover-trigger="${popover.dataset.popover}"]`);
        if (trigger) trigger.setAttribute('aria-expanded', 'false');
      }
    });
  }

  document.addEventListener('click', (event) => {
    const trigger = event.target.closest('[data-popover-trigger]');
    if (trigger) {
      const key = trigger.dataset.popoverTrigger;
      const popover = document.querySelector(`[data-popover="${key}"]`);
      const open = popover && popover.classList.contains('is-open');
      closePopovers(open ? null : key);
      if (popover) {
        popover.classList.toggle('is-open', !open);
        trigger.setAttribute('aria-expanded', String(!open));
      }
      event.stopPropagation();
      return;
    }

    const selectOption = event.target.closest('[data-select]');
    if (selectOption) {
      const key = selectOption.dataset.select;
      const value = selectOption.dataset.value;
      const label = document.querySelector(`[data-value-for="${key}"]`);
      if (label) label.textContent = value;
      selectOption.parentElement.querySelectorAll('.option-row').forEach((row) => row.classList.remove('selected'));
      selectOption.classList.add('selected');
      closePopovers();
      return;
    }

    const multiOption = event.target.closest('[data-multi]');
    if (multiOption) {
      const key = multiOption.dataset.multi;
      const value = multiOption.dataset.value;
      multiOption.classList.toggle('selected');
      const check = multiOption.querySelector('.option-check');
      if (check) check.textContent = '';
      const target = document.querySelector(`[data-chip-target="${key}"]`);
      if (target) {
        const selected = [...document.querySelectorAll(`[data-multi="${key}"].selected`)].map((item) => item.dataset.value);
        target.innerHTML = selected.map((item) => `<span class="form-chip selected">${item}</span>`).join('');
      }
      return;
    }

    const comboOption = event.target.closest('[data-combobox-option]');
    if (comboOption) {
      const input = document.querySelector('[data-combobox-input="provider"]');
      if (input) input.value = comboOption.dataset.comboboxOption;
      comboOption.parentElement.querySelectorAll('.option-row').forEach((row) => row.classList.remove('selected'));
      comboOption.classList.add('selected');
      return;
    }

    const comboCreate = event.target.closest('[data-combobox-create]');
    if (comboCreate) {
      const input = document.querySelector('[data-combobox-input="provider"]');
      if (input && input.value.trim()) {
        comboCreate.querySelector('strong').textContent = `"${input.value.trim()}" anlegen`;
      }
      return;
    }

    const modeButton = event.target.closest('[data-mode-button]');
    if (modeButton) {
      const group = modeButton.dataset.modeButton;
      const mode = modeButton.dataset.mode;
      document.querySelectorAll(`[data-mode-button="${group}"]`).forEach((button) => button.classList.toggle('active', button === modeButton));
      document.querySelectorAll(`[data-mode-panel^="${group}-"]`).forEach((panel) => {
        panel.classList.toggle('hidden', panel.dataset.modePanel !== `${group}-${mode}`);
      });
      closePopovers();
      return;
    }

    const dateButton = event.target.closest('[data-date-value]');
    if (dateButton) {
      const value = dateButton.dataset.dateValue;
      const label = document.querySelector('[data-value-for="date"]');
      if (label) label.textContent = value;
      document.querySelectorAll('[data-date-value]').forEach((day) => day.classList.remove('selected'));
      dateButton.classList.add('selected');
      closePopovers();
      return;
    }

    const timeButton = event.target.closest('[data-time-value]');
    if (timeButton) {
      const value = timeButton.dataset.timeValue;
      const label = document.querySelector('[data-value-for="time"]');
      if (label) label.textContent = value;
      document.querySelectorAll('[data-time-value]').forEach((slot) => slot.classList.remove('selected'));
      timeButton.classList.add('selected');
      closePopovers();
      return;
    }

    const filePick = event.target.closest('[data-file-pick]');
    if (filePick) {
      document.querySelector('[data-file-row]')?.classList.remove('hidden');
      const status = document.querySelector('[data-file-status]');
      if (status) status.textContent = 'scan-2026-06-12.pdf wurde lokal ausgewaehlt.';
      return;
    }

    const fileClear = event.target.closest('[data-file-clear]');
    if (fileClear) {
      document.querySelector('[data-file-row]')?.classList.add('hidden');
      const status = document.querySelector('[data-file-status]');
      if (status) status.textContent = 'PDF, JPG, PNG oder HEIC.';
      return;
    }

    const secretToggle = event.target.closest('[data-secret-toggle]');
    if (secretToggle) {
      const field = document.querySelector('[data-secret-value]');
      if (field) {
        const shown = field.dataset.shown === 'true';
        field.textContent = shown ? '**** **** 3921' : field.dataset.secretValue;
        field.dataset.shown = String(!shown);
        secretToggle.textContent = shown ? 'Wert anzeigen' : 'Wert verbergen';
      }
      return;
    }

    const sheetOpen = event.target.closest('[data-sheet-open]');
    if (sheetOpen) {
      const sheet = document.querySelector(`[data-sheet="${sheetOpen.dataset.sheetOpen}"]`);
      if (sheet) {
        sheet.classList.add('is-open');
        sheet.setAttribute('aria-hidden', 'false');
      }
      return;
    }

    const sheetClose = event.target.closest('[data-sheet-close]');
    if (sheetClose) {
      const sheet = sheetClose.closest('[data-sheet]');
      if (sheet) {
        sheet.classList.remove('is-open');
        sheet.setAttribute('aria-hidden', 'true');
      }
      return;
    }

    if (!event.target.closest('.popover')) closePopovers();
  });

  document.querySelectorAll('[data-combobox-input]').forEach((input) => {
    input.addEventListener('focus', () => {
      document.querySelector(`[data-combobox-menu="${input.dataset.comboboxInput}"]`)?.classList.add('is-open');
    });

    input.addEventListener('input', () => {
      document.querySelector(`[data-combobox-menu="${input.dataset.comboboxInput}"]`)?.classList.add('is-open');
      const value = input.value.trim();
      const create = document.querySelector('[data-combobox-create] strong');
      if (create) create.textContent = value ? `"${value}" anlegen` : 'Neuen Anbieter anlegen';
    });
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
      closePopovers();
      document.querySelectorAll('[data-sheet]').forEach((sheet) => {
        sheet.classList.remove('is-open');
        sheet.setAttribute('aria-hidden', 'true');
      });
    }
  });
})();
